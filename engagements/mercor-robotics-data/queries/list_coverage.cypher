MATCH (s:SubVertical)
OPTIONAL MATCH (s)-[:CONTAINS]->(a:Account)
WITH s,
     count(a) AS accounts,
     sum(CASE WHEN a.disposition = 'qualified' THEN 1 ELSE 0 END) AS qualified,
     sum(CASE WHEN a.disposition STARTS WITH 'held' THEN 1 ELSE 0 END) AS held,
     sum(CASE WHEN a.disposition STARTS WITH 'kill' THEN 1 ELSE 0 END) AS killed
RETURN s.name AS subvertical,
       s.wave AS wave,
       s.vertical AS vertical,
       accounts,
       qualified,
       held,
       killed
ORDER BY s.wave, s.vertical, s.name;
