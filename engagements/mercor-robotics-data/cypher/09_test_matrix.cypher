// One Hypothesis per grid cell. One variable moves per comparison.
UNWIND $cells AS cell
MERGE (h:Hypothesis {id: cell.id})
SET h.cell_key = cell.subvertical + '|' + cell.persona + '|' + cell.angle,
    h.subvertical = cell.subvertical,
    h.persona = cell.persona,
    h.angle = cell.angle,
    h.wave = cell.wave,
    h.status = coalesce(h.status, 'untested'),
    h.min_contacted = coalesce(cell.min_contacted, 40)
WITH h, cell
MATCH (s:SubVertical {name: cell.subvertical})
MERGE (h)-[:TARGETS]->(s)
WITH h, cell
MATCH (p:Prior {subject: 'angle:' + cell.angle})
MERGE (p)-[:SPAWNS]->(h);
