// Probe campaign. Same shape as any later test. Does not send.
MATCH (h:Hypothesis {id: $hypothesisId})
MERGE (c:Campaign {id: $campaignId})
SET c.kind = 'probe',
    c.channel = 'manual_existing_mailbox',
    c.status = 'planned'
MERGE (c)-[:TESTS]->(h)
WITH c
UNWIND $variants AS row
MERGE (v:Variant {id: row.id})
SET v.angle = row.angle,
    v.persona = row.persona,
    v.body = row.body
MERGE (c)-[:CONTAINS_VARIANT]->(v);

// Outcomes only when $outcomes is non-empty and every row has variant_id.
UNWIND $outcomes AS row
WITH row WHERE row.variant_id IS NOT NULL
MATCH (v:Variant {id: row.variant_id})
MERGE (o:Outcome {id: row.id})
SET o.variant_id = row.variant_id,
    o.occurred_at = row.occurred_at,
    o.type = row.type,
    o.objection_text = row.objection_text
MERGE (o)-[:RESULT_OF]->(v)
FOREACH (_ IN CASE WHEN row.contact_email IS NULL THEN [] ELSE [1] END |
  MERGE (p:Contact {email: row.contact_email})
  MERGE (o)-[:FROM]->(p)
);
