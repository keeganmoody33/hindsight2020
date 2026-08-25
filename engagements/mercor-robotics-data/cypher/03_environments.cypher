// Environment × Task spine. Loaded from $environments and $tasks.
// Expected production counts: 15 environments, 101 tasks.
// Empty lists are valid until the Commercial Environments sheet is dropped.
UNWIND $environments AS env
MERGE (e:Environment {name: env.name})
SET e.diversity_rank = env.diversity_rank
FOREACH (_ IN CASE WHEN env.source_doc IS NULL THEN [] ELSE [1] END |
  MERGE (p:Prior {
    source_doc: env.source_doc,
    subject: 'environment:' + env.name,
    predicate: 'listed_in_commercial_sheet'
  })
  SET p.object = env.name,
      p.asserted_by = env.asserted_by,
      p.asserted_at = env.asserted_at,
      p.confidence = 'untested',
      p.status = 'untested'
);

UNWIND $tasks AS task
MERGE (e:Environment {name: task.environment})
MERGE (t:CaptureTask {environment: task.environment, name: task.name})
MERGE (e)-[:CONTAINS]->(t);
