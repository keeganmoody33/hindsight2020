// Uniqueness on natural keys. Idempotent: running twice succeeds.
CREATE CONSTRAINT prior_key IF NOT EXISTS
FOR (p:Prior) REQUIRE (p.source_doc, p.subject, p.predicate) IS NODE KEY;

CREATE CONSTRAINT hypothesis_id IF NOT EXISTS
FOR (h:Hypothesis) REQUIRE h.id IS UNIQUE;

CREATE CONSTRAINT subvertical_name IF NOT EXISTS
FOR (s:SubVertical) REQUIRE s.name IS UNIQUE;

CREATE CONSTRAINT environment_name IF NOT EXISTS
FOR (e:Environment) REQUIRE e.name IS UNIQUE;

CREATE CONSTRAINT task_key IF NOT EXISTS
FOR (t:CaptureTask) REQUIRE (t.environment, t.name) IS NODE KEY;

CREATE CONSTRAINT account_domain IF NOT EXISTS
FOR (a:Account) REQUIRE a.domain IS UNIQUE;

CREATE CONSTRAINT contact_email IF NOT EXISTS
FOR (c:Contact) REQUIRE c.email IS UNIQUE;

CREATE CONSTRAINT campaign_id IF NOT EXISTS
FOR (c:Campaign) REQUIRE c.id IS UNIQUE;

CREATE CONSTRAINT variant_id IF NOT EXISTS
FOR (v:Variant) REQUIRE v.id IS UNIQUE;

CREATE CONSTRAINT outcome_id IF NOT EXISTS
FOR (o:Outcome) REQUIRE o.id IS UNIQUE;

CREATE CONSTRAINT outcome_variant_required IF NOT EXISTS
FOR (o:Outcome) REQUIRE o.variant_id IS NOT NULL;

CREATE CONSTRAINT learning_id IF NOT EXISTS
FOR (l:Learning) REQUIRE l.id IS UNIQUE;

CREATE CONSTRAINT domain_name IF NOT EXISTS
FOR (d:Domain) REQUIRE d.name IS UNIQUE;

CREATE CONSTRAINT inbox_email IF NOT EXISTS
FOR (i:Inbox) REQUIRE i.email IS UNIQUE;
