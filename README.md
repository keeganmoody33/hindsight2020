# Hindsight

A reusable **quick-start agent OS**. Drop context in, ingest it into an engagement pack, do the work, then encode lessons back into the system so the next engagement is faster.

Hindsight is the operating system. An engagement is a *pack* under `engagements/<slug>/`. Client names never belong in this README, in `AGENTS.md`, or in skill names.

## Loop

1. Drop raw material in [`inbox/`](inbox/) (briefs, transcripts, notes, exports).
2. Run **ingest-context** — cited pack under `engagements/<slug>/`.
3. Run **boot-engagement** — load that pack as working context.
4. Do the work. Spend and send stay gated.
5. Run **iterate-system** when a lesson would help the *next* pack, not just this one.

## Skill layers

| Layer | Where | How to update |
| --- | --- | --- |
| Vendor (Matt Pocock) | [`.agents/skills/`](.agents/skills/) | Follow [Vendor refresh](#vendor-refresh). |
| Hindsight (owned) | [`.cursor/skills/`](.cursor/skills/) | Edit in this repo. Never copy these into `.agents/skills/`. |
| Trusted canon | [`system/trusted-resources.md`](system/trusted-resources.md) | Consult before inventing. Clone a source only when `iterate-system` says so. |

## Vendor refresh

From the repository root, refresh the existing vendored set only with:

```sh
npx --yes skills@latest update --project --yes
```

Review `.agents/skills/` and `skills-lock.json` together, then commit their corresponding changes together. Never hand-edit vendored skill files or commit a partial vendor/lock refresh.

`skills add` is only for deliberately adding a new upstream skill or source after `iterate-system` identifies a missing capability. It is not a refresh command.

Cursor loads both `.agents/skills/` and `.cursor/skills/`. Start a **new** agent chat after pulling skill changes; existing sessions will not pick them up.

## Layout

```
inbox/                 raw drops (untouched sources)
engagements/           processed packs (one folder per engagement)
  _template/           empty pack shape
system/                OS changelog + trusted resources
AGENTS.md              operate the OS vs work a pack
CONTEXT.md             Hindsight vocabulary
CONTEXT-MAP.md         OS context vs engagement packs
docs/agents/           issue tracker, triage labels, domain layout
```

## First run

1. Put a drop in `inbox/`.
2. Ask the agent to ingest it (`ingest-context`).
3. Ask it to boot that pack before doing engagement work.

Vendor engineering skills (`/to-spec`, `/triage`, `/wayfinder`) read [`docs/agents/`](docs/agents/). They track work *on this OS*, not work inside a client's CRM.
