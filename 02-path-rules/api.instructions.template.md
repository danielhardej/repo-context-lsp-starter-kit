---
applyTo: "{{API_GLOBS}}"
---

# API Rules

- Keep one Fastify route per file.
- Validate input with zod at the edge before calling domain logic.
- Return errors as RFC 7807 problem details; omit sensitive values from details.
- Keep pure calculations in `{{DOMAIN_PACKAGE_PATH}}`; keep I/O in service code.
