# Sources

| id | sanitized description | sanitized locator or hash | sensitivity | distribution decision |
| --- | --- | --- | --- | --- |
| | | | | |

- Use stable source IDs (`S1`, `S2`, …) in tracked derivatives. For local-only raw material the locator is `local-raw`, not a content digest.
- Never record a full or truncated content hash (SHA-256 or similar) here. Digests stay in ignored `raw/` objects and `.idmap` so a repository reader cannot confirm a candidate document was ingested.
- The locator must identify the local source without reproducing private names, contact details, terms, credentials, or other sensitive values.
- Record sensitivity and the explicit distribution decision before adding any derivative to version control.
- A repository-approved source still permits only minimum-necessary sanitized content, never unnecessary private data.
