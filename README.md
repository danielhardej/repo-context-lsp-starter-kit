# Repo Context & LSP Starter Kit

Takeaway files for AGL's GitHub Copilot champions from
**Module 1: Context Engineering & Repo Intelligence**.
Copy selected templates into an active repository, adapt them, and use the
checklists to coach your squad. This kit does not contain an application.

## Thirty-minute quick start

| Minutes | Action |
| --- | --- |
| 0–8 | Draft a one-page brief; replace every placeholder and run each command. |
| 8–14 | Add two path rules with globs that match your actual files. |
| 14–18 | Add a package AGENTS.md containing only local differences. |
| 18–25 | Install trusted servers; copy the CLI LSP configuration and test it. |
| 25–30 | Check instruction References, review the change and choose an owner. |

## Six parts

| Part | Takeaway |
| --- | --- |
| [01-repo-brief](01-repo-brief/README.md) | One page, validated commands, guardrails. |
| [02-path-rules](02-path-rules/README.md) | API, UI, test and IaC samples with applyTo globs. |
| [03-agents-md](03-agents-md/README.md) | Commands, definition of done, boundaries. |
| [04-lsp](04-lsp/README.md) | CLI server definitions for TypeScript, Python, Java, C#, Go and Terraform. |
| [05-boundary-rubric](05-boundary-rubric/README.md) | Where each rule lives, plus the six smells. |
| [06-champion-playbook](06-champion-playbook/README.md) | Verification checklist and a squad demo script. |

## Safety and scope

Templates are inert here. Each part explains where to copy and rename its files.
Only the root AGENTS.md and .github/copilot-instructions.md govern this kit.
Instructions guide the model; they do not guarantee compliance or replace tests,
review or security controls. They do not apply to inline suggestions as you type.
VS Code agents use the editor's language services; `.github/lsp.json` is for Copilot CLI.

The worked example is [meter-platform](https://github.com/danielhardej/meter-platform).
Its stack, architecture and commands are workshop examples, not validated here.
Use synthetic NMIs such as `TEST000001`; never use customer records.

## Validate this kit

With Node.js 22 or newer:

```sh
npm ci --ignore-scripts
npm run validate
```

Validation lints all Markdown, parses all repository JSON and checks relative
Markdown links, heading anchors and inert filenames. It excludes `.git`,
`node_modules` and `.validation-output`. Pull requests run the same checks.
It does not validate destination-repo commands or start language servers.

## Later modules

See the [module hand-offs](docs/references.md#module-hand-offs): `/plan` belongs
to Module 2; prompt files, skills, custom agents and MCP belong to Module 6.

## Sources

Use the [references](docs/references.md) when verifying behaviour.
