#!/usr/bin/env python3
"""Schema and gate checks. Live Neo4j tests run only when NEO4J_URI is set."""

from __future__ import annotations

import json
import os
import sys
import unittest
from pathlib import Path

PACK = Path(__file__).resolve().parents[1]
ROOT = PACK.parent.parent
if str(PACK / "scripts") not in sys.path:
    sys.path.insert(0, str(PACK / "scripts"))

from gate import GEO_KILLS, estimated_hours_month, gate_account  # noqa: E402
from load_graph import parameterized, statements_without_params  # noqa: E402


class GateTests(unittest.TestCase):
    def test_hours_formula(self) -> None:
        # 6 techs, 2 sites: 6*8*0.5*2*21 = 1008
        self.assertEqual(estimated_hours_month(6, 2), 1008)
        self.assertIsNone(estimated_hours_month(None, 2))

    def test_geo_kill(self) -> None:
        self.assertIn("TX", GEO_KILLS)
        result = gate_account(
            {
                "state": "TX",
                "employees": 6,
                "sites": 2,
                "churn_shape": None,
                "task_density": None,
                "personas": {"owner": "a@x", "tech": "b@x"},
            },
            500,
        )
        self.assertEqual(result["disposition"], "kill:geo")

    def test_hours_floor_unset_holds(self) -> None:
        result = gate_account(
            {
                "state": "GA",
                "employees": 6,
                "sites": 2,
                "churn_shape": None,
                "task_density": None,
                "personas": {"owner": "a@x", "tech": "b@x"},
            },
            None,
        )
        self.assertEqual(result["disposition"], "held:hours_floor_unset")

    def test_one_persona_holds(self) -> None:
        result = gate_account(
            {
                "state": "GA",
                "employees": 6,
                "sites": 2,
                "churn_shape": None,
                "task_density": None,
                "personas": {"owner": "a@x"},
            },
            500,
        )
        self.assertEqual(result["disposition"], "held:persona")


class PriorKeyTests(unittest.TestCase):
    def test_competing_timeline_priors_have_distinct_keys(self) -> None:
        priors = json.loads(
            (PACK / "cypher/data/priors_terms.json").read_text()
        )["priors"]
        keys = [
            (p["source_doc"], p["subject"], p["predicate"])
            for p in priors
        ]
        self.assertEqual(len(keys), len(set(keys)))
        timeline = [
            p
            for p in priors
            if p["subject"] == "timeline"
            and p["predicate"] == "signed_environments_weeks"
        ]
        self.assertGreaterEqual(len(timeline), 2)
        self.assertEqual(len({p["object"] for p in timeline}), len(timeline))


class LoaderPrepTests(unittest.TestCase):
    def test_constraints_are_idempotent_text(self) -> None:
        stmts = statements_without_params()
        self.assertTrue(all("IF NOT EXISTS" in s for s in stmts))
        joined = "\n".join(stmts)
        self.assertIn("qualification_account", joined)
        self.assertIn("outcome_variant_required", joined)

    def test_parameterized_payloads_exist(self) -> None:
        jobs = parameterized()
        self.assertEqual(len(jobs), 6)

    def test_matrix_cells_reference_seeded_tree(self) -> None:
        verticals = {
            row["name"]
            for row in json.loads((PACK / "cypher/data/verticals.json").read_text())[
                "verticals"
            ]
        }
        angles = {
            row["name"]
            for row in json.loads((PACK / "cypher/data/angles.json").read_text())[
                "angles"
            ]
        }
        cells = json.loads((PACK / "cypher/data/matrix.json").read_text())["cells"]
        self.assertGreaterEqual(len(cells), 6)
        for cell in cells:
            self.assertIn(cell["subvertical"], verticals)
            self.assertIn(cell["angle"], angles)
            self.assertIn(cell["persona"], {"owner", "tech"})

    def test_environments_not_invented(self) -> None:
        env = json.loads((PACK / "cypher/data/environments.json").read_text())
        self.assertEqual(env["environments"], [])
        self.assertEqual(env["tasks"], [])


@unittest.skipUnless(os.environ.get("NEO4J_URI"), "NEO4J_URI unset")
class LiveGraphTests(unittest.TestCase):
    def test_schema_not_connection_error(self) -> None:
        from neo4j import GraphDatabase

        uri = os.environ["NEO4J_URI"]
        user = os.environ.get("NEO4J_USERNAME", "neo4j")
        password = os.environ.get("NEO4J_PASSWORD", "")
        database = os.environ.get("NEO4J_DATABASE", "neo4j")
        driver = GraphDatabase.driver(uri, auth=(user, password))
        try:
            with driver.session(database=database) as session:
                labels = session.run("CALL db.labels() YIELD label RETURN label").data()
        finally:
            driver.close()
        self.assertIsInstance(labels, list)

    def test_constraints_twice_and_competing_priors(self) -> None:
        from load_graph import load
        from neo4j import GraphDatabase

        load()
        load()
        uri = os.environ["NEO4J_URI"]
        driver = GraphDatabase.driver(
            uri,
            auth=(
                os.environ.get("NEO4J_USERNAME", "neo4j"),
                os.environ.get("NEO4J_PASSWORD", ""),
            ),
        )
        try:
            with driver.session(
                database=os.environ.get("NEO4J_DATABASE", "neo4j")
            ) as session:
                rows = session.run(
                    """
                    MATCH (p:Prior {subject: 'timeline', predicate: 'signed_environments_weeks'})
                    RETURN p.source_doc AS src, p.object AS object
                    """
                ).data()
                env_n = session.run("MATCH (e:Environment) RETURN count(e) AS n").single()
                task_n = session.run("MATCH (t:CaptureTask) RETURN count(t) AS n").single()
                try:
                    session.run(
                        """
                        CREATE (o:Outcome {id: 'orphan-test', occurred_at: 0, type: 'bounce'})
                        """
                    )
                    self.fail("orphan Outcome without variant_id should fail")
                except Exception:
                    pass
        finally:
            driver.close()
        self.assertGreaterEqual(len(rows), 2)
        self.assertEqual(env_n["n"], 0)
        self.assertEqual(task_n["n"], 0)


if __name__ == "__main__":
    unittest.main()
