---
name: iterate-system
description: Encode a process lesson into Hindsight (owned skill, template, or gate) after consulting trusted resources. Use when a correction would help the next engagement, the user says iterate the OS, or pack work exposed a missing seam. Never promote one pack's facts into the OS.
---

# Iterate the OS

Process → Hindsight. Facts → the pack.

## SENSE

1. Name the lesson in one sentence (what went wrong or what would speed the next pack).
2. Read [`system/trusted-resources.md`](../../../system/trusted-resources.md). Ask: does Context OS, Karlstrom, or LeadGrow already solve this? If yes, point at that pattern and wrap it in a thin Hindsight skill or AGENTS.md pointer — do not clone the repo.

## ORIENT

3. Decide the encode target, strongest first:
   - Template or pack skeleton (`engagements/_template/`)
   - Owned skill under `.cursor/skills/`
   - Gate line in `AGENTS.md` (only if a skill cannot carry it)
   - `system/changelog.md` note when the lesson is real but not yet a skill
4. If the change is ambiguous, run `/grill-me` or `/grill-with-docs` before writing. Write skills with `/writing-for-agents`.

## ACT

5. Edit the owned layer only (`.cursor/skills/`, `system/`, templates, `AGENTS.md`, root `CONTEXT.md`). Do not edit `.agents/skills/` by hand.
6. Keep client names and pack facts out of the OS. Capabilities stay generic.

## DEPOSIT

7. Append a dated line to [`system/changelog.md`](../../../system/changelog.md).
8. If a new term resolved, add it to root `CONTEXT.md`.

Completion: the next cold agent would get the lesson from a file, not from this chat.
