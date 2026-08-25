// Accounts that cleared every gate, ranked by estimated hours.
// Params: $hoursFloor (number). Unset floor returns empty — fail closed.
MATCH (a:Account)-[:SCORED_BY]->(q:Qualification)
WHERE $hoursFloor IS NOT NULL
  AND a.disposition = 'qualified'
  AND q.estimated_hours_month >= $hoursFloor
OPTIONAL MATCH (a)-[:HAS_PERSONA]->(c:Contact)
WITH a, q, collect({persona: c.persona, email: c.email}) AS contacts
RETURN a.domain AS domain,
       a.name AS name,
       a.subvertical AS subvertical,
       q.estimated_hours_month AS estimated_hours_month,
       contacts,
       a.disposition AS disposition
ORDER BY q.estimated_hours_month DESC;
