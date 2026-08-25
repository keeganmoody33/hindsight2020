---
name: ingest-context
description: Ingest an inbox drop (brief, transcript, notes, export) into an engagement pack with cited quotes, paraphrases, and unknowns. Use when the user drops files in inbox/, says ingest, or asks to turn raw context into a pack. Do not invent ICP, tools, or client facts.
---

# Ingest a drop into a pack

Turn untouched source material into `engagements/<slug>/`. Provenance first. Empty judgment files stay empty.

## SENSE

1. Find the drop: `inbox/` (or a path the user named). If several drops, ask which one unless the user already named it.
2. If `engagements/<slug>/` already exists for this drop, **extend** it (append sources, do not duplicate the folder). Completion: you know slug + whether this is create or extend.

Slug: kebab-case from the drop's own name for the work (company + motion if present). Never use a client name in OS files; the pack folder may be named after the engagement.

## ORIENT

3. Read [`engagements/_template/`](../../../engagements/_template/README.md) and [`system/trusted-resources.md`](../../../system/trusted-resources.md) (Context OS ingest + Karlstrom provenance).
4. Copy the template to `engagements/<slug>/` on create. Copy the drop into `engagements/<slug>/raw/` unchanged.

## ACT

5. Write `sources.md` — one row per source, stable ids (`S1`, `S2`, …).
6. Write `engagement.md` — who, done-looks-like, constraints, capabilities named in the drop, open questions. Label each bullet **quote**, **paraphrase**, or **unknown**. Quotes are verbatim in `>` with the source id. Paraphrases stay cited. Unknowns stay unknown.
7. Write pack `CONTEXT.md` — terms the drop actually uses. Opinionated `_Avoid_` only when the drop distinguishes synonyms.
8. Fill `context/icp.md`, `personas.md`, `exclusions.md`, `rubric.md` **only** where the drop contains that judgment. Otherwise leave the skeleton text.

Do not: invent facts, research the company to "complete" the pack, copy pack facts into `AGENTS.md` or root `CONTEXT.md`, send or enrich.

## DEPOSIT

9. Add the pack to [`CONTEXT-MAP.md`](../../../CONTEXT-MAP.md) under Engagement packs (link `engagements/<slug>/CONTEXT.md`).
10. Tell the user the slug and that **boot-engagement** is next for pack work.

Completion: pack exists; every non-unknown claim has a source id; judgment files that the drop did not support are still empty skeletons.
