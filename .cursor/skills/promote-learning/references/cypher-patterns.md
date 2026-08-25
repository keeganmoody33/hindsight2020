# Learning MERGE

If `n < min_contacted`, set `verdict` to `thin` and do not change Prior status.

```cypher
MERGE (l:Learning {id: $learningId})
SET l.verdict = $verdict, l.n = $n
WITH l
UNWIND $outcomeIds AS oid
MATCH (o:Outcome {id: oid})
MERGE (l)-[:EVIDENCED_BY]->(o)
WITH DISTINCT l
MATCH (p:Prior {source_doc: $sourceDoc, subject: $subject, predicate: $predicate})
MERGE (l)-[:UPDATES]->(p)
SET p.status = $newStatus;
```

Canonical copy: `engagements/mercor-robotics-data/skills/references/cypher-patterns.md`.
