# Graph schema

Peers with `context/`. Markdown does not duplicate node inventories.

## Nodes

| Label | Natural key | Required properties |
| --- | --- | --- |
| `Prior` | `(source_doc, subject, predicate)` | `object`, `asserted_by`, `asserted_at`, `confidence`, `status` |
| `Hypothesis` | `id` | `cell_key`, `status` |
| `SubVertical` | `name` | `vertical`, `wave` |
| `Environment` | `name` | |
| `CaptureTask` | `(environment, name)` | |
| `Account` | `domain` | `disposition` |
| `Contact` | `email` | `persona` |
| `Qualification` | `account_domain` | `estimated_hours_month` |
| `Campaign` | `id` | |
| `Variant` | `id` | `angle` |
| `Outcome` | `id` | `variant_id`, `occurred_at`, `type` |
| `Learning` | `id` | `verdict`, `n` |
| `Domain` | `name` | `warmup_policy` |
| `Inbox` | `email` | `warmup_started`, `ready_at` |

`Prior.status`: `untested` \| `testing` \| `supported` \| `refuted` \| `retired`.

`Account.disposition`: `qualified` \| `held` \| a named kill reason (`geo`, `hours`, `churn_shape`, `task_density`).

## Edges

| Type | From | To |
| --- | --- | --- |
| `SPAWNS` | Prior | Hypothesis |
| `TARGETS` | Hypothesis | SubVertical |
| `CONTAINS` | SubVertical | Account |
| `CONTAINS` | Environment | CaptureTask |
| `HAS_PERSONA` | Account | Contact |
| `SCORED_BY` | Account | Qualification |
| `TESTS` | Campaign | Hypothesis |
| `CONTAINS_VARIANT` | Campaign | Variant |
| `RESULT_OF` | Outcome | Variant |
| `FROM` | Outcome | Contact |
| `EVIDENCED_BY` | Learning | Outcome |
| `UPDATES` / `RETIRES` | Learning | Prior |
| `HOSTED_ON` | Inbox | Domain |

## Enforced rules

- Two Priors with the same subject and different `source_doc` both persist.
- `Outcome.variant_id` is required. Loaders refuse an Outcome with no `RESULT_OF` to a `Variant`.
- Primary corporate domain is never an `Inbox` host. Alt domains only.
- `Inbox.ready_at` must be set before a send skill proceeds.

## Capture ratio

`estimated_hours_month = employees * 8 * 0.50 * sites * 21` (0.50 is a Prior).
