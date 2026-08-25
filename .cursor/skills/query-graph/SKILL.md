---
name: query-graph
description: Query the GTM graph in natural language. Use when the user asks what's untested, which angle wins, which persona replies, which objections recur, list coverage, or whether a learning updated a prior. Also use when they ask "what's in the graph?"
---

# Query the graph

Use standing queries first. Do not compose live Cypher in a demo.

## SENSE

1. Map the question to `engagements/mercor-robotics-data/queries/standing.cypher` or `demo/queries.cypher`.
2. If they ask "what's in the graph?", run schema via `gtm-get_neo4j_schema` (needs APOC) or `CALL db.labels()`.

## ACT

3. Pass timestamps as parameters. Do not use `Date.now()` inside a stored query.
4. Competing Priors on the same subject: return **every** row with `source_doc`. Do not pick a winner.
5. If copy needs a rate or cadence and Priors conflict, surface them to the human: which number goes in front of a business owner?

## DEPOSIT

6. Answer with counts and source_docs. Empty qualified lists are valid when the hours floor is unset.
