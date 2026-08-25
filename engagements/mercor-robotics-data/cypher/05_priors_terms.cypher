UNWIND $priors AS row
MERGE (p:Prior {
  source_doc: row.source_doc,
  subject: row.subject,
  predicate: row.predicate
})
SET p.object = row.object,
    p.asserted_by = row.asserted_by,
    p.asserted_at = row.asserted_at,
    p.confidence = coalesce(row.confidence, 'untested'),
    p.status = coalesce(row.status, 'untested');
