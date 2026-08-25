from __future__ import annotations

from typing import Any

GEO_KILLS = frozenset({"CA", "CO", "IL", "TX", "WA"})
CHURN_KILLS = frozenset({"outdoor-heat", "idle-walking", "single-motion"})
CAPTURE_RATIO = 0.5
DAYS_PER_MONTH = 21


def estimated_hours_month(employees: int | None, sites: int | None) -> float | None:
    if employees is None or sites is None:
        return None
    return employees * 8 * CAPTURE_RATIO * sites * DAYS_PER_MONTH


def gate_account(account: dict[str, Any], hours_floor: float | None) -> dict[str, Any]:
    hours = estimated_hours_month(account.get("employees"), account.get("sites"))
    personas = account.get("personas") or {}
    persona_count = len([v for v in personas.values() if v])

    if account.get("state") in GEO_KILLS:
        disposition = "kill:geo"
    elif account.get("churn_shape") in CHURN_KILLS:
        disposition = "kill:churn_shape"
    elif account.get("task_density") == "idle_or_walking":
        disposition = "kill:task_density"
    elif hours_floor is None:
        disposition = "held:hours_floor_unset"
    elif hours is None:
        disposition = "held:hours_unknown"
    elif hours < hours_floor:
        disposition = "kill:hours"
    elif persona_count < 2:
        disposition = "held:persona"
    else:
        disposition = "qualified"
    return {"hours": hours, "disposition": disposition}
