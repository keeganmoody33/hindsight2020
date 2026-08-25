---
name: ingest-context
description: Ingest an inbox drop (brief, transcript, notes, export) into a sanitized engagement pack with cited quotes, paraphrases, and unknowns. Use when the user drops files in inbox/, says ingest, or asks to turn raw context into a pack. Do not invent ICP, tools, client facts, or tasks from an unread external plan URL.
---

# Ingest a drop into a pack

Turn local source material into a sanitized `engagements/<slug>/` derivative. Privacy and provenance come first. Empty judgment files stay empty.

## SENSE

1. Find the drop in ignored `inbox/` or another local-only path the user named. If several drops exist, ask which one unless the user already named it. Do not display raw contents while locating it. A URL to an authenticated plan host (including `plan.ref.tools`) is not a drop until its body is in this session: paste, a publicly fetchable link, or a working Plans MCP `Read`. Sign-in HTML or HTTP 401 is a stop, not a prompt to guess the work.
2. Apply the pre-ingest gate in [`system/privacy-and-distribution.md`](../../../system/privacy-and-distribution.md):
   - Classify sensitivity before deriving content. Raw correspondence and data containing personal contacts, compensation or commercial terms, identity or background-check information, credentials, health or financial data are sensitive.
   - Record the distribution decision. Default to **local-only** unless an authorized human explicitly approves a sanitized derivative for the repository audience. Without that approval, stop before writing tracked pack files and report the local-only decision.
   - Confirm local raw paths are ignored with `git check-ignore`. Version control is distribution, not per-file access control.
   - If sensitive source material is tracked, staged, or already published, stop and escalate. Do not ingest or commit it.
3. Before a create or extend ingest changes any tracked pack file, derive the source's full SHA-256 content digest locally and assign its stable source ID:
   - The full digest is a **local-only** object identity. Never write `sha256:<digest>`, a truncated content hash, or any other verifier of the raw bytes into tracked files (including `sources.md`). A published digest lets anyone who holds a candidate document confirm it was ingested.
   - Tracked locator is `local-raw` plus the stable source ID (`S1`, `S2`, …). Original basename, filename, and local path are not provenance identities and must not appear in tracked metadata when sensitive.
   - Record digest → source ID only in ignored `engagements/<slug>/raw/.idmap`. Never stage that file. On extend, hash the drop, look up the ignored object and `.idmap`, and reuse that source ID. Otherwise assign the next unused `S#`; on create, begin with `S1`. One digest keeps one source ID across the pack.
   - Treat identical digests as the same immutable source object. Different bytes produce a different digest, source identity, and object; never resolve a collision by overwriting or renaming an existing object.
4. Determine whether `engagements/<slug>/` already exists for this source. If so, **extend** it without duplicating the folder or the source record. Completion: you know the slug, create vs extend, sensitivity and distribution decision, full digest (local only), stable source ID, and whether an ignored local raw object is required. If the digest or stable identity cannot be established, stop before changing tracked pack files and report the provenance failure.

Slug: kebab-case from the drop's own name for the work (company + motion if present). Never use a client name in OS files; the pack folder may be named after the engagement.

## ORIENT

5. Read [`engagements/_template/`](../../../engagements/_template/README.md), [`system/trusted-resources.md`](../../../system/trusted-resources.md) (Context OS ingest + Karlstrom provenance), and the privacy policy linked above.
6. Establish the immutable raw boundary before changing tracked pack files:
   - Never copy private raw material into tracked pack files. When a local pack raw object is necessary, its only destination identity is ignored `engagements/<slug>/raw/<full-sha256>`; do not preserve the original basename or add a revealing extension.
   - Confirm the exact destination is ignored, then use create-only/no-clobber behavior. If the object already exists, verify its bytes produce the expected full digest before reuse. If newly created, verify the copied bytes produce the expected full digest before continuing.
   - Reuse a verified object for an identical digest. Different bytes necessarily use their different digest path. Never overwrite, replace, or rename an existing raw object.
   - If the ignore boundary, create-only write, or post-copy verification cannot be established, stop before changing tracked pack files and report the provenance failure.
7. On create, copy only the tracked template files to `engagements/<slug>/` after the source identity and any required local raw object pass these checks.

## ACT

8. Write `sources.md` first — one row per unique source, using the stable source ID assigned in SENSE and locator `local-raw`. On extend, reuse the row and ID for an identical local digest; do not create an alias. Record sensitivity and distribution decision, but never a content digest, sensitive filename, path, identity, or value in tracked metadata. Do not continue unless the stable ID, ignored `.idmap` entry, and any local raw object all refer to the same source bytes.
9. Write `engagement.md` — only the minimum-necessary sanitized facts needed for who, done-looks-like, constraints, approved capabilities, and open questions. Label each bullet **quote**, **paraphrase**, or **unknown**, and cite the source ID. A quote or paraphrase must not reintroduce restricted values. Unknowns stay unknown.
10. Write pack `CONTEXT.md` — sanitized terms the drop actually uses. Opinionated `_Avoid_` only when the drop distinguishes synonyms.
11. Fill `context/icp.md`, `personas.md`, `exclusions.md`, `rubric.md` **only** where the drop contains that judgment and repository distribution is approved. Otherwise leave the skeleton text.

If an authorized human explicitly approves a drop for repository distribution, track only sanitized content necessary for the pack. Approval never authorizes unnecessary private data.

Do not: invent facts, research the company to "complete" the pack, copy pack facts into `AGENTS.md` or root `CONTEXT.md`, send or enrich.

## DEPOSIT

12. Re-check the staged or tracked derivative for restricted values and confirm raw paths remain ignored.
13. Add the sanitized pack to [`CONTEXT-MAP.md`](../../../CONTEXT-MAP.md) under Engagement packs (link `engagements/<slug>/CONTEXT.md`).
14. Tell the user the slug, the recorded distribution decision, and that **boot-engagement** is next for pack work.

Completion: the sanitized pack exists; every non-unknown claim has a source ID; `sources.md` records the stable source ID and `local-raw` (no content digest); raw material is content-addressed under ignored paths, untracked, and never overwritten; sensitivity and distribution decisions are recorded; judgment files that the drop did not support are still empty skeletons.
