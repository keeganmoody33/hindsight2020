// Six standing queries. Run with a wall-clock $now passed in — never Date.now() in the query file.

// 1. Untested priors
MATCH (p:Prior)
WHERE p.status = 'untested'
RETURN p.source_doc AS source_doc, p.subject AS subject, p.predicate AS predicate, p.object AS object
ORDER BY p.subject, p.source_doc;

// 2. Angle wins per sub-vertical (needs Outcomes)
MATCH (h:Hypothesis)<-[:TESTS]-(c:Campaign)-[:CONTAINS_VARIANT]->(v:Variant)<-[:RESULT_OF]-(o:Outcome)
WHERE o.type IN ['positive_reply', 'booked', 'signed']
RETURN h.subvertical AS subvertical, h.angle AS angle, count(o) AS positives
ORDER BY subvertical, positives DESC;

// 3. Persona replies
MATCH (h:Hypothesis)<-[:TESTS]-(c:Campaign)-[:CONTAINS_VARIANT]->(v:Variant)<-[:RESULT_OF]-(o:Outcome)
WHERE o.type IN ['positive_reply', 'booked']
RETURN h.persona AS persona, count(o) AS replies
ORDER BY replies DESC;

// 4. Recurring objections
MATCH (o:Outcome)
WHERE o.objection_text IS NOT NULL AND o.objection_text <> ''
RETURN o.objection_text AS objection, count(*) AS n
ORDER BY n DESC;

// 5. Qualified coverage vs wave-1 (see list_coverage.cypher)

// 6. Learnings that have not updated a Prior (health check)
MATCH (l:Learning)
WHERE NOT (l)-[:UPDATES|RETIRES]->(:Prior)
RETURN l.id AS learning, l.verdict AS verdict, l.n AS n;
