# Hindsight

Quick-start agent OS. Two jobs exist: **work on the OS**, or **work a pack**. Decide which one this session is before writing files.

## Which job

**OS work** — changing Hindsight itself (skills, templates, `AGENTS.md`, `system/`). Load this file, [`CONTEXT.md`](CONTEXT.md), [`system/trusted-resources.md`](system/trusted-resources.md). Reach `iterate-system`. Do not write client facts into the OS layer.

**Pack work** — an engagement. Reach `boot-engagement` with the slug. Load `engagements/<slug>/`. Tools named in that pack are capabilities for *that pack only*.

## SENSE → ORIENT → ACT → DEPOSIT

Before creating a file or skill: check whether it already exists (inbox drop, pack, trusted resource, Hindsight skill). After writing: link it (pack `sources.md`, OS `system/changelog.md`, or a wiki-style pointer). Do not add taxonomy or ontology files agents will never read.

## Ingest

Raw material lands in [`inbox/`](inbox/). `ingest-context` turns it into `engagements/<slug>/`. Quote vs paraphrase vs unknown. Every claim tagged to a source. Empty `context/` skeletons stay empty until the drop contains that judgment.

## Gates

Drafts are the default. Paid enrichment, CRM writes, and any send (email, LinkedIn, sequencer, Slack outbound) wait for an explicit human yes in this session.

## Skill layers

- **Vendor** — [`.agents/skills/`](.agents/skills/). Refresh with `npx skills update -y`. Do not edit by hand; wrap in a Hindsight skill instead.
- **Owned** — [`.cursor/skills/`](.cursor/skills/): `ingest-context`, `boot-engagement`, `iterate-system`.
- **Canon** — [`system/trusted-resources.md`](system/trusted-resources.md). Consult before inventing a pipeline, research loop, or ingest shape.

On OS changes, grill with `/grill-me` or `/grill-with-docs` when the change is ambiguous. Write skills with `/writing-for-agents`. Hand off with `/handoff`.

## Agent skills

### Issue tracker

GitHub Issues on this repo, via `gh`. Tracks work *on Hindsight*. See `docs/agents/issue-tracker.md`.

### Triage labels

Default five roles, same strings as the tracker. See `docs/agents/triage-labels.md`.

### Domain docs

Multi-pack: root `CONTEXT.md` is the OS; `CONTEXT-MAP.md` lists packs; each `engagements/<slug>/CONTEXT.md` is a separate context. See `docs/agents/domain.md`.
