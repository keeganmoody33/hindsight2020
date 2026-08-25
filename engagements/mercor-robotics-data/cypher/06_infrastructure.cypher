UNWIND $domains AS row
MERGE (d:Domain {name: row.name})
SET d.registrar = row.registrar,
    d.redirect = row.redirect,
    d.purchased_at = row.purchased_at,
    d.status = row.status
FOREACH (_ IN CASE WHEN row.forbidden THEN [1] ELSE [] END |
  SET d.forbidden = true
);

UNWIND $inboxes AS row
MERGE (d:Domain {name: row.domain})
MERGE (i:Inbox {email: row.email})
SET i.warmup_started = row.warmup_started,
    i.warmup_days = row.warmup_days,
    i.ready_at = row.ready_at,
    i.status = row.status
MERGE (i)-[:HOSTED_ON]->(d);
