---
name: log-campaign
description: Log a campaign or record that we sent a test. Use when the user says "log a campaign", "we sent", or names a hypothesis cell to attach sends to. Refuses a campaign with no Hypothesis and refuses an unwarmed inbox.
---

# Log a campaign

Prose in, `MERGE` out. One campaign occupies one matrix cell.

## SENSE

1. Boot the pack if not already. Read `engagements/<slug>/schema.md`.
2. Identify Hypothesis `id` (sub-vertical × persona × angle). If none exists, stop — do not create a campaign for an empty cell without generating the Hypothesis via `cypher/09_test_matrix.cypher`.
3. If the channel is automated, read Inbox `ready_at`. Stop when status is not `ready`. Manual probe from an existing mailbox is allowed (Task 5) and still logs as `kind: probe`.

## ACT

4. `MERGE` Campaign, Variants, `TESTS` → Hypothesis, `CONTAINS_VARIANT` → Variant. Templates: `engagements/mercor-robotics-data/skills/references/cypher-patterns.md`.
5. Do not write Outcomes here.

## DEPOSIT

6. Return campaign id, hypothesis id, variant ids. Spend/send still need an explicit human yes; this skill only records.
