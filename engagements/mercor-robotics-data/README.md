# Engagement pack — robotics-data outbound

Pack-local Context OS: Neo4j graph + skills that instrument every send. Hindsight stays the OS; this folder is the pack.

## Graph vs markdown

- `context/` — voice, offer language, ICP copy. Not a second database.
- `cypher/` + `queries/` — entities, edges, time, status.
- Neither restates the other.

## First run

1. Copy [`.env.example`](../../.env.example) to `.env` with Aura Free credentials, or `docker compose up -d` in this folder.
2. `python3 scripts/load_graph.py`
3. `python3 scripts/verify_graph.py` (skips live checks if `NEO4J_URI` is unset).
4. Boot this pack before pack work. Spend, Clay, and send stay gated.

## Hard lines

- No historical outcomes.
- No franchise-list ingest.
- No send from an unwarmed inbox; no campaign without a Hypothesis.
- Domain purchase and live sends are human tasks (Task 4 / Task 5). This pack tracks them; it does not execute them.
