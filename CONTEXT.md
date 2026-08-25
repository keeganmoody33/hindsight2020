# Hindsight

Keegan's reusable quick-start agent OS: ingest any engagement's context, work the pack, encode lessons back into the system.

## Language

**Hindsight**:
The operating system in this repo. Skills, templates, and standing docs that are not about one client.
_Avoid_: product, app, naming the OS after a client, GTM workspace (as a name for the OS)

**Engagement pack** (or **pack**):
A folder under `engagements/<slug>/` holding cited context for one piece of work.
_Avoid_: project, client repo, workspace

**Inbox drop** (or **drop**):
Untouched source material in `inbox/`, not yet ingested.
_Avoid_: upload, attachment (unless quoting a specific tool)

**Ingest**:
Turn a drop into a pack with quote / paraphrase / unknown and source tags.
_Avoid_: import, scrape, summarize (ingest preserves provenance)

**Boot**:
Load a pack as the working context for a session.
_Avoid_: open, activate (except as a synonym in passing)

**OS work**:
Changing Hindsight itself.
_Avoid_: meta-work, refactor (too vague)

**Pack work**:
Doing the engagement the pack describes.
_Avoid_: client work (fine in speech; in docs prefer pack work)

**Trusted resource**:
A named external canon in `system/trusted-resources.md`. Consult before inventing.
_Avoid_: inspiration, blog, random GitHub

**Capability**:
A tool or provider a pack may use (CRM, enricher, sequencer). Not an OS identity.
_Avoid_: integration (as if Hindsight *is* Clay/Attio)

**Gate**:
A human yes required before spend or send.
_Avoid_: approval workflow, compliance hold (unless the pack names those)

**Judgment file**:
Versioned markdown in a pack's `context/` (ICP, personas, exclusions, rubric) filled only from evidence.
_Avoid_: prompt, system prompt (judgment does not live in the agent prompt)
