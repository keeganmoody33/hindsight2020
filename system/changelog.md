# OS changelog

Process lessons encoded into Hindsight. Pack-specific facts do not belong here.

## 2026-08-25

- Scaffolded the OS: vendor skills already on `main`; owned skills `ingest-context`, `boot-engagement`, `iterate-system`; inbox / packs / trusted resources; Matt setup docs as multi-pack GitHub Issues.
- Added a privacy-by-default ingest gate: raw drops remain ignored and local; tracked packs contain only minimum-necessary sanitized derivatives with source sensitivity and distribution decisions.
- Made local raw identity immutable and content-addressed: full SHA-256 objects use create-only/no-clobber handling; tracked `sources.md` uses stable source IDs and `local-raw`, not published content digests.
- Track per-pack `raw/README.md` (and optional `raw/.gitignore`) so generated pack guidance is not ignored; still ignore every other `raw/` object.
- Designated README's `Vendor refresh` section as the canonical workflow for refreshing `.agents/skills/` and `skills-lock.json` together.
- External plan URLs (Ref and similar) are locators, not specs: stop on login wall / MCP 401; do not invent the work.
- Untracked previously committed correspondence from HEAD and ignore inbox/raw paths. A current-tree delete is not a history purge; the owner still has to decide whether history and forks need remediation.
