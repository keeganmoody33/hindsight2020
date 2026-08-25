---
name: ingest-context
description: Ingest an inbox drop (brief, transcript, notes, export) into a sanitized engagement pack with cited quotes, paraphrases, and unknowns. Use when the user drops files in inbox/, says ingest, or asks to turn raw context into a pack. Do not invent ICP, tools, or client facts.
---

# Ingest a drop into a pack

Turn local source material into a sanitized `engagements/<slug>/` derivative. Privacy and provenance come first. Empty judgment files stay empty.

## SENSE

1. Find the drop in ignored `inbox/` or another local-only path the user named. If several drops exist, ask which one unless the user already named it. Do not display raw contents while locating it.
2. Apply the pre-ingest gate in [`system/privacy-and-distribution.md`](../../../system/privacy-and-distribution.md):
   - Classify sensitivity before deriving content. Raw correspondence and data containing personal contacts, compensation or commercial terms, identity or background-check information, credentials, health or financial data are sensitive.
   - Record the distribution decision. Default to **local-only** unless an authorized human explicitly approves a sanitized derivative for the repository audience. Without that approval, stop before writing tracked pack files and report the local-only decision.
   - Confirm local raw paths are ignored with `git check-ignore`. Version control is distribution, not per-file access control.
   - If sensitive source material is tracked, staged, or already published, stop and escalate. Do not ingest or commit it.
3. After repository distribution of a sanitized derivative is approved, determine whether `engagements/<slug>/` already exists for this drop. If so, **extend** it (append sources, do not duplicate the folder). Completion: you know slug, create vs extend, sensitivity, and distribution decision.

Slug: kebab-case from the drop's own name for the work (company + motion if present). Never use a client name in OS files; the pack folder may be named after the engagement.

## ORIENT

4. Read [`engagements/_template/`](../../../engagements/_template/README.md), [`system/trusted-resources.md`](../../../system/trusted-resources.md) (Context OS ingest + Karlstrom provenance), and the privacy policy linked above.
5. Copy the template to `engagements/<slug>/` on create. Never copy private raw material into tracked pack files. If a local working copy is necessary, place it under ignored `engagements/<slug>/raw/` only after `git check-ignore` confirms the destination is ignored.

## ACT

6. Write `sources.md` — one row per source with a stable ID (`S1`, `S2`, …), sanitized locator or hash, sensitivity, and distribution decision. Do not put a sensitive filename, path, identity, or value in tracked metadata.
7. Write `engagement.md` — only the minimum-necessary sanitized facts needed for who, done-looks-like, constraints, approved capabilities, and open questions. Label each bullet **quote**, **paraphrase**, or **unknown**, and cite the source ID. A quote or paraphrase must not reintroduce restricted values. Unknowns stay unknown.
8. Write pack `CONTEXT.md` — sanitized terms the drop actually uses. Opinionated `_Avoid_` only when the drop distinguishes synonyms.
9. Fill `context/icp.md`, `personas.md`, `exclusions.md`, `rubric.md` **only** where the drop contains that judgment and repository distribution is approved. Otherwise leave the skeleton text.

If an authorized human explicitly approves a drop for repository distribution, track only sanitized content necessary for the pack. Approval never authorizes unnecessary private data.

Do not: invent facts, research the company to "complete" the pack, copy pack facts into `AGENTS.md` or root `CONTEXT.md`, send or enrich.

## DEPOSIT

10. Re-check the staged or tracked derivative for restricted values and confirm raw paths remain ignored.
11. Add the sanitized pack to [`CONTEXT-MAP.md`](../../../CONTEXT-MAP.md) under Engagement packs (link `engagements/<slug>/CONTEXT.md`).
12. Tell the user the slug, the recorded distribution decision, and that **boot-engagement** is next for pack work.

Completion: the sanitized pack exists; every non-unknown claim has a source ID; `sources.md` records the sensitivity and distribution decision; raw material is ignored and untracked; judgment files that the drop did not support are still empty skeletons.
