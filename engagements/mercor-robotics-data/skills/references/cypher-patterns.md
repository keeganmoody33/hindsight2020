# Cypher patterns

Use parameterized Cypher only.

## Campaign

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

## Outcome (variant_id required)

```cypher
MATCH (v:Variant {id: $variantId})
MERGE (o:Outcome {id: $outcomeId})
SET o.variant_id = $variantId,
    o.occurred_at = $occurredAt,
    o.type = $type,
    o.objection_text = $objectionText
MERGE (o)-[:RESULT_OF]->(v);
```

Refuse if `$variantId` is null. Do not `CREATE` an Outcome without the `MATCH` on Variant.

## Learning

```cypher
MERGE (l:Learning {id: $learningId})
SET l.verdict = $verdict, l.n = $n
WITH l
UNWIND $outcomeIds AS oid
MATCH (o:Outcome {id: oid})
MERGE (l)-[:EVIDENCED_BY]->(o)
WITH DISTINCT l
MATCH (p:Prior {source_doc: $sourceDoc, subject: $subject, predicate: $predicate})
MERGE (l)-[:UPDATES]->(p)
SET p.status = $newStatus;
```
