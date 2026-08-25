# Context Map

## Contexts

- [Hindsight](./CONTEXT.md): the quick-start OS — skills, ingest loop, trusted resources. Not a client.
- Engagement packs: each [`engagements/<slug>/CONTEXT.md`](./engagements/_template/CONTEXT.md) is its own context. Listed here only after ingest creates the pack.
  - [robotics-data outbound](./engagements/mercor-robotics-data/CONTEXT.md)

## Relationships

- **Hindsight → pack**: ingest writes a pack; boot loads it. OS files do not copy pack facts.
- **Pack → Hindsight**: `iterate-system` may encode a *process* lesson into owned skills or templates. Pack-specific facts stay in the pack.
- **Trusted resources → Hindsight**: canon for how to ingest, gate, and research. Not vendored into `.agents/skills/`.
