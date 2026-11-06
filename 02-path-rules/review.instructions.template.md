---
applyTo: "{{REVIEW_GLOBS}}"
excludeAgent: "cloud-agent"
---

# Review Rules

- Flag NMIs or customer PII passed to log calls, including nested objects.
- Flag new dependencies without an accompanying architecture decision record (ADR).
- Flag removed or bypassed input validation on readings and payment routes.
