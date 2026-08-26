# Sources

| id | sanitized description | sanitized locator or hash | sensitivity | distribution decision |
| --- | --- | --- | --- | --- |
| S1 | Kickoff-call notes in the scene brief | local-raw | sensitive | local-only |
| S2 | Second-operator call notes in the scene brief | local-raw | sensitive | local-only |
| S3–S7 | Email threads cited in the scene brief | local-raw | sensitive | local-only |
| DROP | Assembled scene brief | local-raw | sensitive | local-only |
| REF | Ref plan taxonomy / funnel / exclusions | plan.ref.tools locator | mixed | derivatives only |
| S8 | Inbound application form export | local-raw | sensitive | local-only; test rows only; excluded from graph |
| S9 | Referral form export | local-raw | sensitive | local-only; test rows only; excluded from graph |
| S10 | Commercial Environment Strategy | local-raw | mixed | sanitized derivative approved 2026-08-26 |
| S11 | Commercial Environments diversity sheet | local-raw | taxonomy | sanitized derivative approved 2026-08-26 |
| S12 | External warehouse-pilot proposal (priced) | local-raw | sensitive | local-only; excluded |
| S13 | First-call talking points | local-raw | mixed | sanitized derivative approved 2026-08-26 |
| S14 | Franchise / previously-contacted list | local-raw | sensitive | local-only; excluded from graph |
| S15 | Partner landing-page before/after | local-raw | mixed | sanitized derivative approved 2026-08-26 |
| S16 | Onboard-experience stub | local-raw | mixed | local-only; not extracted |
| S17 | Target ICP lead lists | local-raw | sensitive | local-only; excluded from graph |
| S18 | v2 lead list | local-raw | sensitive | local-only; excluded from graph |

Raw correspondence, form PII, franchise rows, and lead rows are not tracked. Taxonomy extracts under `cypher/data/` are **untested Priors**, not facts. The team dump is not assumed correct.
