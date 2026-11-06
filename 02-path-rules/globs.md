# Glob Guide

## Match actual paths

`applyTo` is a quoted string containing one or more comma-separated globs,
relative to the repository root, not to `.github/instructions/`.
Use `/` separators on Windows too.

| Glob | Matches | Does not match |
| --- | --- | --- |
| `*.py` | Root-level Python files | `jobs/export.py` |
| `jobs/*.py` | `jobs/export.py` | `jobs/nightly/export.py` |
| `jobs/**/*.py` | Python files at any depth under `jobs/` | `web/export.py` |
| `services/readings/**/*.ts` | Readings TypeScript files | Billing TypeScript files |
| `**/*.test.ts,**/*.spec.ts` | Both Vitest naming patterns at any depth | `handler.ts` |
| `web/**/*.ts,web/**/*.tsx` | Both extensions under `web/` | `packages/domain/tariff.ts` |
| `**` | Every file | Nothing excluded by this pattern |

Example frontmatter after replacing the template placeholder:

```yaml
---
applyTo: "services/readings/**/*.ts,services/billing/**/*.ts"
---
```

VS Code also reads optional `name` and `description` fields. They are not required
for these path-matched examples. Keep the same rule in one owning file rather
than relying on a precedence order.

## Exclude a GitHub agent

| Value | Effect |
| --- | --- |
| No `excludeAgent` | Both cloud agent and code review can use a matching file. |
| `"code-review"` | GitHub code review does not use the file. |
| `"cloud-agent"` | GitHub cloud agent does not use the file. |

Do not treat either value as a VS Code enable/disable setting.
The [review sample](review.instructions.template.md) remains available to code
review and contains no comment-format, PR-overview or merge-blocking instructions.

## Verify

Check a matching and non-matching file using
[the README procedure](README.md#check-scope).
Consult the [official references](../docs/references.md#copilot-and-vs-code).
