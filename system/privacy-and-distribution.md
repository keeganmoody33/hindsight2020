# Privacy and distribution

Version control distributes content to every person and system with repository access. It is not per-file access control, and a later deletion does not remove prior commits or downstream copies.

## Pre-ingest gate

Before reading source material into a tracked derivative:

1. **Classify sensitivity.** Treat raw correspondence and data containing personal contacts, compensation or commercial terms, identity or background-check information, credentials, health or financial data as sensitive.
2. **Decide distribution.** Default sensitive or unclear material to **local-only**. Repository distribution of a sanitized derivative requires explicit authorization for the repository audience. Without it, do not write tracked pack files.
3. **Verify the boundary.** Keep source material under ignored `inbox/` or `engagements/<slug>/raw/` paths and confirm the path with `git check-ignore` before use.
4. **Minimize the derivative.** Track only sanitized facts necessary for the engagement. Quotes, paraphrases, filenames, locators, and hashes must not expose or allow reconstruction of restricted values. Do not publish content digests of private sources; they confirm membership of a candidate document.
5. **Record provenance safely.** In `sources.md`, use a stable source ID plus a sanitized locator (`local-raw` for ignored pack raw objects), sensitivity classification, and distribution decision. Keep content digests off the tracked tree.

Explicit approval for repository distribution permits a sanitized, minimum-necessary derivative only. It never permits unnecessary private data or the raw source.

## Stop and escalate

Do not stage or commit source material that fails this gate. If sensitive material is already tracked or published, stop routine ingest and coordinate remediation with the repository owner. Depending on exposure, remediation may require a Git history purge, removal of downstream copies, notification, or credential and secret rotation. Deleting the current-tree file alone is not a history purge.
