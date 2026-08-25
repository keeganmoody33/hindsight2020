---
name: boot-engagement
description: Load an engagement pack as working context before pack work. Use when the user names a slug, says boot, or starts work that needs ingested context. Tools in the pack are capabilities for that pack only.
---

# Boot a pack

Make `engagements/<slug>/` the working context for this session.

## SENSE

1. Resolve the slug. If none, list `engagements/` (skip `_template`) and ask. If the folder is missing, stop and point at `ingest-context`.

## ORIENT

2. Read, in order: `engagement.md`, `CONTEXT.md`, `sources.md`. Then any non-skeleton files under `context/`.
3. Note **capabilities** listed in `engagement.md` (CRM, enrichers, sequencers, graph). They apply to this pack only. Hindsight is not those tools. If the pack has `schema.md`, graph skills `log-campaign` / `log-outcome` / `promote-learning` / `query-graph` apply after boot.

## ACT

4. State in one short block: slug, done-looks-like, open questions, named capabilities, gates still closed (no spend, no send without an explicit yes).
5. Use pack vocabulary from that `CONTEXT.md` for the rest of the session.

Do not: promote pack facts into the OS; treat a named capability as globally installed; send or pay.

Completion: the user can see what was loaded and what is still unknown. Pack work may begin.
