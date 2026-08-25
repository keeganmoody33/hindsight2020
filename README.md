# hindsight2020

## Agent skills

This repo vendors [Matt Pocock's skills](https://github.com/mattpocock/skills) (MIT) into `.agents/skills/` so they load on **Cursor Desktop and Cloud Agents**. Cursor discovers project skills from `.agents/skills/` automatically.

After this lands on a branch you are working on:

1. Start a **new** Agent chat (or a new Cloud Agent). Existing sessions will not pick up newly added skills.
2. Run `/setup-matt-pocock-skills` once for this repo (issue tracker, triage labels, docs layout).
3. Run `/wayfinder` to chart the product.

To refresh the vendored set later:

```bash
npx skills@latest add mattpocock/skills --agent cursor --skill '*' --copy --yes
```
