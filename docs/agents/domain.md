# Domain Docs

How the engineering skills should consume this repo's domain documentation when exploring the codebase.

This repo is **multi-pack**, not a code monorepo. Root glossary is the OS. Each engagement pack has its own `CONTEXT.md`.

## Before exploring, read these

- **`CONTEXT-MAP.md`** at the repo root: OS vs packs.
- **`CONTEXT.md`** at the repo root for OS work (Hindsight vocabulary).
- **`engagements/<slug>/CONTEXT.md`** for pack work. Infer slug from the user's request or `boot-engagement`.
- **`docs/adr/`**: OS-wide decisions. Pack-scoped ADRs, if any, live at `engagements/<slug>/docs/adr/`.

If a pack `CONTEXT.md` does not exist, **proceed silently** on OS work; for pack work, ingest first. The `/domain-modeling` skill (via `/grill-with-docs`) creates terms lazily when they actually get resolved.

## File structure

```
/
├── CONTEXT.md                     ← Hindsight OS
├── CONTEXT-MAP.md
├── docs/adr/                      ← OS-wide ADRs
├── docs/agents/                   ← tracker, triage, this file
└── engagements/
    ├── _template/
    └── <slug>/
        ├── CONTEXT.md             ← that pack
        └── docs/adr/              ← optional pack ADRs
```

Do not look for `src/<context>/CONTEXT.md`. That layout is for application monorepos; this OS is not one.

## Use the glossary's vocabulary

OS work: use root `CONTEXT.md`. Pack work: use that pack's `CONTEXT.md`. Don't drift to synonyms the glossary explicitly avoids.

If the concept you need isn't in the glossary yet, that's a signal: either you're inventing language the project doesn't use (reconsider) or there's a real gap (note it for `/domain-modeling` or `iterate-system`).

## Flag ADR conflicts

If your output contradicts an existing ADR, surface it explicitly rather than silently overriding:

> _Contradicts ADR-0007 (…), but worth reopening because…_
