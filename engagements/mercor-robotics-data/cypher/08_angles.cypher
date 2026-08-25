UNWIND $angles AS row
MERGE (p:Prior {
  source_doc: row.source_doc,
  subject: 'angle:' + row.name,
  predicate: 'in_set'
})
SET p.object = row.name,
    p.asserted_by = row.asserted_by,
    p.asserted_at = row.asserted_at,
    p.confidence = 'untested',
    p.status = 'untested';
