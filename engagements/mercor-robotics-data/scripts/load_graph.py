#!/usr/bin/env python3
"""Apply pack Cypher in order. No-op live writes when NEO4J_URI is unset."""

from __future__ import annotations

import json
import os
from pathlib import Path

PACK = Path(__file__).resolve().parents[1]
CYPHER = PACK / "cypher"
DATA = CYPHER / "data"


def _read(name: str) -> str:
    return (CYPHER / name).read_text()


def _json(name: str) -> dict[str, object]:
    return json.loads((DATA / name).read_text())


def statements_without_params() -> list[str]:
    chunks: list[str] = []
    for fname in ("01_constraints.cypher", "02_indexes.cypher"):
        for part in _read(fname).split(";"):
            stmt = part.strip()
            if stmt:
                chunks.append(stmt)
    return chunks


def parameterized() -> list[tuple[str, dict[str, object]]]:
    env = _json("environments.json")
    vert = _json("verticals.json")
    priors = _json("priors_terms.json")
    infra = _json("infrastructure.json")
    angles = _json("angles.json")
    matrix = _json("matrix.json")
    return [
        (
            _read("03_environments.cypher"),
            {
                "environments": env.get("environments", []),
                "tasks": env.get("tasks", []),
            },
        ),
        (_read("04_verticals.cypher"), {"verticals": vert.get("verticals", [])}),
        (_read("05_priors_terms.cypher"), {"priors": priors.get("priors", [])}),
        (
            _read("06_infrastructure.cypher"),
            {
                "domains": infra.get("domains", []),
                "inboxes": infra.get("inboxes", []),
            },
        ),
        (_read("08_angles.cypher"), {"angles": angles.get("angles", [])}),
        (_read("09_test_matrix.cypher"), {"cells": matrix.get("cells", [])}),
    ]


def load() -> str:
    uri = os.environ.get("NEO4J_URI", "").strip()
    if not uri:
        return "dry-run: NEO4J_URI unset; statements prepared, nothing written"

    try:
        from neo4j import GraphDatabase
    except ImportError as exc:
        raise SystemExit("pip install neo4j, or unset NEO4J_URI") from exc

    user = os.environ.get("NEO4J_USERNAME", "neo4j")
    password = os.environ.get("NEO4J_PASSWORD", "")
    database = os.environ.get("NEO4J_DATABASE", "neo4j")
    driver = GraphDatabase.driver(uri, auth=(user, password))
    try:
        with driver.session(database=database) as session:
            for stmt in statements_without_params():
                session.run(stmt)
            for stmt, params in parameterized():
                for part in stmt.split(";"):
                    chunk = part.strip()
                    if chunk:
                        session.run(chunk, params)
    finally:
        driver.close()
    return "loaded"


if __name__ == "__main__":
    print(load())
