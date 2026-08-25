# Outcome MERGE

Refuse if `$variantId` is null. Do not `CREATE` an Outcome without the `MATCH` on Variant.

```cypher
MATCH (v:Variant {id: $variantId})
MERGE (o:Outcome {id: $outcomeId})
SET o.variant_id = $variantId,
    o.occurred_at = $occurredAt,
    o.type = $type,
    o.objection_text = $objectionText
MERGE (o)-[:RESULT_OF]->(v);
```

Canonical copy: `engagements/mercor-robotics-data/skills/references/cypher-patterns.md`.
