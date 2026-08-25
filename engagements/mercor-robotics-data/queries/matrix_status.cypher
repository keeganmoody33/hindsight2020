MATCH (h:Hypothesis)
OPTIONAL MATCH (c:Campaign)-[:TESTS]->(h)
OPTIONAL MATCH (c)-[:CONTAINS_VARIANT]->(v:Variant)<-[:RESULT_OF]-(o:Outcome)
WITH h, count(DISTINCT o) AS outcomes, count(DISTINCT c) AS campaigns
RETURN h.id AS hypothesis,
       h.subvertical AS subvertical,
       h.persona AS persona,
       h.angle AS angle,
       h.wave AS wave,
       h.status AS status,
       campaigns,
       outcomes,
       h.min_contacted AS min_contacted_for_verdict
ORDER BY h.wave, h.subvertical, h.persona, h.angle;
