# Standing queries

Run files under `engagements/mercor-robotics-data/queries/`. Pass `$now` / `$hoursFloor` as parameters. Never `Date.now()` inside Cypher.

| Question | File / section |
| --- | --- |
| What's untested? | `standing.cypher` #1 |
| Which angle wins? | `standing.cypher` #2 |
| Which persona replies? | `standing.cypher` #3 |
| Which objections recur? | `standing.cypher` #4 |
| List coverage | `list_coverage.cypher` |
| Learnings with no Prior update | `standing.cypher` #6 |
| Qualified targets | `qualified_targets.cypher` |
| Matrix status | `matrix_status.cypher` |
| What's in the graph? | `CALL db.labels()` or `gtm-get_neo4j_schema` |

Competing Priors on the same subject: return **every** row with `source_doc`. Do not pick a winner.
