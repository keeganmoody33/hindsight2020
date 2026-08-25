# Source corpus

Provenance for **taxonomy only**. Do not ingest outcomes.

## Load

Drop the nine corpus files here as local-only copies when distribution is approved. Until then this folder stays empty of source bytes. The graph loader reads structured extracts under `cypher/data/`, not this folder.

## Explicitly excluded

These never enter the graph, even if they appear in a drop:

- The franchise / previously-contacted list (no recoverable message, dates, or variants). Re-sends to those rows are not a fresh test.
- Form exports that contain only internal test rows.
- Any uninstrumented send history (`Contacted - no response` with unknown copy).

The first `Outcome` in this graph must come from a send logged with a `Variant`.

## Expected extracts (not present yet)

| Extract | Expected shape | Status |
| --- | --- | --- |
| Commercial Environments sheet | 15 environments × named capture tasks (101) | **blocked** — sheet not in this repo |
| Strategy appendix environments | cross-check against the sheet | blocked on the same drop |
| Ad-brief vertical order | wave / ranking Prior | seeded from the Ref plan tree only |
| Diversity rank | Prior per environment | blocked |
| Tier friction ranking | Prior | blocked |
| Kickoff-call segments | Prior | seeded from already-published pack notes |
| Cadence / referral bonus | competing terms as Priors | seeded as `unset` until corpus numbers land |

Do not invent the 101 capture tasks. When the sheet lands, write `cypher/data/environments.json` and `cypher/data/tasks.json` and re-run `scripts/load_graph.py`.
