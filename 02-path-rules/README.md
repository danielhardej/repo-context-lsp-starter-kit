# Path Rules

API, UI, test and IaC samples with applyTo globs.
Copy only the rules your repo needs. Matching rules load alongside the
repository-wide brief, not instead of it. This folder contains inert templates.

## Copy and rename

| Kit file | Destination | Replace applyTo with, for example |
| --- | --- | --- |
| [api.instructions.template.md](api.instructions.template.md) | `.github/instructions/api.instructions.md` | `services/readings/**/*.ts,services/billing/**/*.ts` |
| [frontend.instructions.template.md](frontend.instructions.template.md) | `.github/instructions/frontend.instructions.md` | `web/**/*.ts,web/**/*.tsx` |
| [tests.instructions.template.md](tests.instructions.template.md) | `.github/instructions/tests.instructions.md` | `**/*.test.ts,**/*.spec.ts` |
| [terraform.instructions.template.md](terraform.instructions.template.md) | `.github/instructions/terraform.instructions.md` | `infra/**/*.tf,infra/**/*.tfvars` |
| [review.instructions.template.md](review.instructions.template.md) | `.github/instructions/review.instructions.md` | `**/*.ts,**/*.tsx,jobs/**/*.py,**/package.json` |
| [globs.md](globs.md) | Your context authoring notes | Read here or copy; no required rename. |

These are squad conventions, not built-in Copilot requirements. API and test
examples suit meter-platform. Terraform patterns illustrate a repo with `infra/`;
they do not assert that meter-platform contains Terraform.
Replace every `{{PLACEHOLDER}}` before activating a template.

## Check scope

Choose one matching file and one non-matching file. Ask a representative question
about each, then check VS Code chat's References list and the resulting answer.
Inspect existing rules for conflicting frameworks or duplicate ownership.

The review template uses `excludeAgent: "cloud-agent"`. That excludes the GitHub
cloud agent, not code review, and is not a VS Code harness switch.
Code review reads the PR's head branch, so test instruction edits in the same PR.
Keep files short; GitHub suggests about 1,000 lines at most per instruction file.
Review does not follow external links or support instructions about comment
formatting, the PR overview or blocking merges. Keep review criteria inline.

## Sources

See [globs](globs.md) and the
[GitHub and VS Code references](../docs/references.md#copilot-and-vs-code).
