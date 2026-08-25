---
name: promote-learning
description: Promote a learning from clustered outcomes. Use when the user says "promote a learning", "retire this prior", or asks whether a cell has enough evidence. Learnings carry evidence counts; n under the cell minimum stays visibly thin.
---

# Promote a learning

Cluster Outcomes into a Learning, set a verdict, update or retire the parent Prior.

## SENSE

1. Count Outcomes on the Hypothesis. If `n < min_contacted`, record the Learning with verdict `thin` and do not change Prior status.
2. Name the Prior being tested (usually `angle:<name>` or a rate/cadence Prior).

## ACT

3. `MERGE` Learning with `n` and `verdict`. `EVIDENCED_BY` each Outcome. `UPDATES` or `RETIRES` the Prior. Set Prior `status` to `supported`, `refuted`, or `retired`.
4. Append a row to pack `context/learnings.md` from graph state (Task 10), not from memory.

## DEPOSIT

5. Return learning id, n, prior status. A verdict from n=3 stays labeled thin.
