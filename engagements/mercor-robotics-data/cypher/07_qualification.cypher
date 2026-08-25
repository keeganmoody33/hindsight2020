// Gate as stored properties plus scoring. $hoursFloor is required to qualify.
// Capture ratio 0.50 is a Prior (untested).
MATCH (a:Account)
OPTIONAL MATCH (a)-[:HAS_PERSONA]->(c:Contact)
WITH a, collect(DISTINCT c.persona) AS personas
WITH a, personas,
     CASE
       WHEN a.employees IS NULL OR a.sites IS NULL THEN NULL
       ELSE a.employees * 8 * 0.50 * a.sites * 21
     END AS hours
SET a.estimated_hours_month = hours
SET a.disposition = CASE
  WHEN a.state IN $geoKills THEN 'kill:geo'
  WHEN a.churn_shape IN $churnKills THEN 'kill:churn_shape'
  WHEN a.task_density = 'idle_or_walking' THEN 'kill:task_density'
  WHEN $hoursFloor IS NULL THEN 'held:hours_floor_unset'
  WHEN hours IS NULL THEN 'held:hours_unknown'
  WHEN hours < $hoursFloor THEN 'kill:hours'
  WHEN size(personas) < 2 THEN 'held:persona'
  ELSE 'qualified'
END
WITH a, hours, personas
WHERE a.disposition = 'qualified'
MERGE (q:Qualification {account_domain: a.domain})
SET q.estimated_hours_month = hours,
    q.persona_count = size(personas),
    q.hours_floor = $hoursFloor
MERGE (a)-[:SCORED_BY]->(q);
