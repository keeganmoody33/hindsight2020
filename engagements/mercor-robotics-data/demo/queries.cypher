// Pre-tested demo set. Pass $hoursFloor. Do not compose variants live.

// A. Untested priors (must be non-empty after load)
MATCH (p:Prior)
WHERE p.status = 'untested'
RETURN p.source_doc, p.subject, p.predicate, p.object
ORDER BY p.subject
LIMIT 25;

// B. Competing timeline priors
MATCH (p:Prior {subject: 'timeline', predicate: 'signed_environments_weeks'})
RETURN p.source_doc, p.object, p.status;

// C. Matrix status
MATCH (h:Hypothesis)
RETURN h.id, h.subvertical, h.persona, h.angle, h.wave, h.status
ORDER BY h.wave, h.subvertical;

// D. Qualified targets (empty until hours floor is set and accounts are upserted)
MATCH (a:Account)
WHERE a.disposition = 'qualified'
RETURN a.domain, a.estimated_hours_month
ORDER BY a.estimated_hours_month DESC
LIMIT 20;

// E. Inbox ready dates (empty until Task 4 purchase)
MATCH (i:Inbox)-[:HOSTED_ON]->(d:Domain)
RETURN i.email, d.name, i.warmup_started, i.ready_at, i.status
ORDER BY i.ready_at;

// F. Health check — Learnings with no Prior update
MATCH (l:Learning)
WHERE NOT (l)-[:UPDATES|RETIRES]->(:Prior)
RETURN l.id, l.n, l.verdict;
