CREATE INDEX prior_subject IF NOT EXISTS FOR (p:Prior) ON (p.subject);
CREATE INDEX prior_status IF NOT EXISTS FOR (p:Prior) ON (p.status);
CREATE INDEX account_domain_lookup IF NOT EXISTS FOR (a:Account) ON (a.domain);
CREATE INDEX outcome_occurred_at IF NOT EXISTS FOR (o:Outcome) ON (o.occurred_at);
CREATE INDEX inbox_ready_at IF NOT EXISTS FOR (i:Inbox) ON (i.ready_at);
CREATE INDEX account_disposition IF NOT EXISTS FOR (a:Account) ON (a.disposition);
