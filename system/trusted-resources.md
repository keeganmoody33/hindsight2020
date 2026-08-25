# Trusted resources

Canon for **OS work**. Read this before adding a Hindsight skill, template, or pipeline. Clone or `npx skills add` a source only when `iterate-system` records that Hindsight is missing a *capability* these already solve.

Do not vendor entire portfolios into `.agents/skills/`.

## jacob-dietle/context-os

<https://github.com/jacob-dietle/context-os>

Closest analog to a quick-start system.

**Borrow**

- Ingest as the first-class loop: raw transcripts/docs/notes → structured, cited nodes
- Two layers only: knowledge vs operational docs; ops docs link to concepts, they do not redefine them
- No ceremony files agents never read (taxonomy/ontology/`_system/` died in v2 for lack of heat)
- SENSE → ORIENT → ACT → DEPOSIT
- Epistemic grounding: quote vs paraphrase, list unknowns, do not fill gaps
- Intent-triggered skills (`quickstart`, `ingest`) rather than a command zoo

**Do not**

- Vendor-install the unfinished context-os CLI in bootstrap
- Recreate `_system/` or ontology YAML

Revisit the CLI if we later want graph heat / co-access.

## kkrlstrm (Kai Karlstrom)

<https://github.com/kkrlstrm>

Governed, observable, repeatable GTM execution.

**Borrow**

- Judgment lives in `context/*.md` (ICP, personas, exclusions, rubric), not in the agent prompt
- Providers are **capabilities** behind config, not OS identity — [gtm-pipeline](https://github.com/kkrlstrm/gtm-pipeline)
- Human **gates** before spend and send
- State survives the run (one list/campaign id)
- Source-verified research with a cost waterfall — [gtm-research](https://github.com/kkrlstrm/gtm-research)
- Observe failures → promote to rules — [cc-logger](https://github.com/kkrlstrm/cc-logger), [agent-guard](https://github.com/kkrlstrm/agent-guard), [callusguard](https://github.com/kkrlstrm/callusguard)
- Provenance-stamped knowledge writes — [knowledge-graph-governance](https://github.com/kkrlstrm/knowledge-graph-governance)
- Pre-send control plane — [gtm-deliverability](https://github.com/kkrlstrm/gtm-deliverability)

**Do not**

- Clone gtm-pipeline into this repo as bootstrap
- Hardcode Clay/Apollo/Attio as "what Hindsight is"

Encode the *seams* (judgment files, gates, provider-agnostic language) so a later pack can adopt the pipeline without rewriting the OS.

## LeadGrowGTM

<https://github.com/LeadGrowGTM>

GTM-operator terminal stack.

**Borrow**

- Self-annealing research processes — validate the process, not a one-off answer — [research-process-builder](https://github.com/LeadGrowGTM/research-process-builder)
- Starter templates / skill index for GTM from one terminal — [claude-code-course](https://github.com/LeadGrowGTM/claude-code-course)
- Iterate the prompts/skills themselves — [auto-prompt-creator](https://github.com/LeadGrowGTM/auto-prompt-creator)
- Discovery CLIs as optional **capabilities** later (DiscoLike, TechSight, AI Ark)

**Do not**

- `npx skills add` the entire org in bootstrap
- Treat a CLI as the OS identity
