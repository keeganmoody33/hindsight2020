export type Disposition =
  | "qualified"
  | "held:persona"
  | "held:hours_floor_unset"
  | "held:hours_unknown"
  | "kill:geo"
  | "kill:hours"
  | "kill:churn_shape"
  | "kill:task_density";

export type Persona = "owner" | "tech";

export type AccountInput = {
  domain: string;
  name: string;
  subvertical: string;
  state: string;
  employees: number | null;
  sites: number | null;
  churn_shape: string | null;
  task_density: string | null;
  personas: Partial<Record<Persona, string>>;
};

const GEO_KILLS = new Set(["CA", "CO", "IL", "TX", "WA"]);
const CHURN_KILLS = new Set(["outdoor-heat", "idle-walking", "single-motion"]);
const CAPTURE_RATIO = 0.5;
const DAYS_PER_MONTH = 21;

export function estimatedHoursMonth(
  employees: number | null,
  sites: number | null,
): number | null {
  if (employees === null || sites === null) {
    return null;
  }
  return employees * 8 * CAPTURE_RATIO * sites * DAYS_PER_MONTH;
}

export function gateAccount(
  account: AccountInput,
  hoursFloor: number | null,
): { hours: number | null; disposition: Disposition } {
  const hours = estimatedHoursMonth(account.employees, account.sites);
  const personaCount = Object.values(account.personas).filter(Boolean).length;

  if (GEO_KILLS.has(account.state)) {
    return { hours, disposition: "kill:geo" };
  }
  if (account.churn_shape !== null && CHURN_KILLS.has(account.churn_shape)) {
    return { hours, disposition: "kill:churn_shape" };
  }
  if (account.task_density === "idle_or_walking") {
    return { hours, disposition: "kill:task_density" };
  }
  if (hoursFloor === null) {
    return { hours, disposition: "held:hours_floor_unset" };
  }
  if (hours === null) {
    return { hours, disposition: "held:hours_unknown" };
  }
  if (hours < hoursFloor) {
    return { hours, disposition: "kill:hours" };
  }
  if (personaCount < 2) {
    return { hours, disposition: "held:persona" };
  }
  return { hours, disposition: "qualified" };
}

export type UpsertRow = AccountInput & {
  hours: number | null;
  disposition: Disposition;
};

export function upsertAccounts(
  rows: AccountInput[],
  hoursFloor: number | null,
): UpsertRow[] {
  return rows.map((row) => {
    const gated = gateAccount(row, hoursFloor);
    return { ...row, hours: gated.hours, disposition: gated.disposition };
  });
}
