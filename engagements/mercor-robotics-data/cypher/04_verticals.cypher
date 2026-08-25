UNWIND $verticals AS row
MERGE (s:SubVertical {name: row.name})
SET s.vertical = row.vertical,
    s.wave = row.wave,
    s.tier_seed = row.tier_seed,
    s.rate_seed = row.rate_seed,
    s.density = row.density,
    s.headcount_band = row.headcount_band,
    s.tasks_note = row.tasks_note
MERGE (p:Prior {
  source_doc: row.source_doc,
  subject: 'subvertical:' + row.name,
  predicate: 'in_tree'
})
SET p.object = row.vertical,
    p.asserted_by = row.asserted_by,
    p.asserted_at = row.asserted_at,
    p.confidence = 'untested',
    p.status = 'untested';
