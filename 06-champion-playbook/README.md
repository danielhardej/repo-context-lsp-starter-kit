# Champion Playbook

Verification checklist and a squad demo script.
Everything here is workshop or example content, not live instructions for this kit.

## Thirty-day plan

Week 1 Write the brief: Pick one active repo. Draft the brief and validate every command.

Week 2 Scope the rules: Add two or three path rules and an AGENTS.md where agents work most.

Week 3 Wire up LSP: Commit .github/lsp.json and install servers in the dev container.

Week 4 Show and share: Demo the before and after to your squad; share lessons in AGL's knowledge library.

## Copy and rename

| Kit file | Destination | Action |
| --- | --- | --- |
| This README | Squad rollout notes | Copy as reference material; no special filename. |
| [verification-checklist.md](verification-checklist.md) | Context-change review notes | Copy or use here; no required rename. |
| [squad-demo-script.md](squad-demo-script.md) | Squad demo notes | Copy and check the sample prerequisites. |
| [before-after-metrics.md](before-after-metrics.md) | Pilot measurement notes | Copy; fill only measured values. |
| [CODEOWNERS.example](CODEOWNERS.example) | `.github/CODEOWNERS` | Merge patterns into existing ownership; replace organisation/team placeholders. |
| [pull_request_template.example.md](pull_request_template.example.md) | `.github/pull_request_template.md` | Merge into your existing PR template; replace placeholders. |

The `.example` filenames keep ownership and PR examples inactive in this kit.
Choose owners with explicit write access; owner teams must be visible.
The last matching CODEOWNERS pattern wins, so check later patterns for overrides.
CODEOWNERS review requests use the PR's base branch, unlike Copilot instruction
loading from the head branch. Request owners manually for the initial ownership PR.
PR templates become available after merging to the default branch.

## Coach the squad

Use the [verification checklist](verification-checklist.md), run the
[ten-minute demo](squad-demo-script.md), then compare the pilot using
[measured evidence](before-after-metrics.md). Review context changes like code:
small changes, a named owner and reproducible checks.

Do not put an internal knowledge-library URL or customer records in this public
kit. Share lessons through AGL's approved internal process outside this repo.

## Later modules and sources

See the [module hand-offs](../docs/references.md#module-hand-offs) for `/plan`
(Module 2) and prompt files, skills, custom agents and MCP (Module 6).
See [ownership and metrics sources](../docs/references.md#ownership-and-measurement).
