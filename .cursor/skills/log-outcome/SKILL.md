---
name: log-outcome
description: Log a reply, objection, bounce, or booked call. Use when the user says "got a reply from", "logged an objection", or records a probe result. Refuses an Outcome with no Variant.
---

# Log an outcome

Every Outcome needs a Variant. Uninstrumented history stays out.

## SENSE

1. Require `variant_id`. If missing, stop.
2. Capture objection text verbatim. Do not summarize into a code until a Learning exists.

## ACT

3. `MERGE` Outcome with `variant_id` and `occurred_at` (caller supplies the timestamp). `RESULT_OF` → Variant. Optional `FROM` → Contact.
4. Templates: `engagements/mercor-robotics-data/skills/references/cypher-patterns.md`.

## DEPOSIT

5. Return outcome id and type. Do not promote a Learning here.
