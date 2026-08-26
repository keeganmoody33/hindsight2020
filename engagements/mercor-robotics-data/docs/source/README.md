# Source corpus

Provenance for **taxonomy only**. Do not ingest outcomes. Raw bytes stay in ignored `inbox/` and `raw/`.

## Load

The graph loader reads structured extracts under `cypher/data/`, not this folder. Corpus PDFs/XLSX are not committed here.

## Explicitly excluded

These never enter the graph, even if they appear in a drop:

- The franchise / previously-contacted list (S14): no recoverable message, dates, or variants.
- Form exports with only internal test rows (S8, S9).
- Lead lists (S17, S18).
- Priced external proposals (S12).
- Any uninstrumented send history (`Contacted - no response` with unknown copy).

The first `Outcome` in this graph must come from a send logged with a `Variant`.

## Extracts

| Extract | Expected shape | Status |
| --- | --- | --- |
| Commercial Environments sheet (S11) | 15 environments × 101 capture tasks | **loaded** as untested Priors in `cypher/data/environments.json` |
| Strategy appendix (S10) | 17 named environments | **Prior only** (`appendix_count` 17 vs sheet 15). Science labs is appendix-only |
| Ad-brief vertical order | wave / ranking Prior | still seeded from the Ref plan tree; S11 diversity rank starts at Event Venue |
| Diversity rank | Prior per environment | **loaded** as `Environment.diversity_rank` from S11 |
| Tier friction ranking | competing Priors | S10 table vs S13 talking points (construction A vs C) |
| Kickoff-call segments | Prior | seeded from pack notes [S1] |
| Cadence / referral bonus | competing Priors | S10 `100-250`, S13 `50-400`, Ref `unset` |
| Landing minimum hours (S15) | `none` | competes with S10 `100+` hours per environment |

Do not invent capture tasks. Re-extract from S11 if the sheet changes; never from S14/S17/S18.
