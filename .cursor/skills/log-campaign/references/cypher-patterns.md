# Campaign MERGE

Refuse if `$hypothesisId` is missing. Automated channel: refuse unless Inbox `status` is `ready` and `ready_at` is set. Probe from an existing mailbox uses `kind: 'probe'`.

```cypher
MATCH (h:Hypothesis {id: $hypothesisId})
MERGE (c:Campaign {id: $campaignId})
SET c.kind = $kind, c.channel = $channel, c.status = 'logged'
MERGE (c)-[:TESTS]->(h)
WITH c
UNWIND $variants AS row
MERGE (v:Variant {id: row.id})
SET v.angle = row.angle, v.persona = row.persona, v.body = row.body
MERGE (c)-[:CONTAINS_VARIANT]->(v);
```

Canonical copy: `engagements/mercor-robotics-data/skills/references/cypher-patterns.md`.
