# Repository Brief

One page, validated commands, guardrails.
Repository-wide instructions in `.github/copilot-instructions.md` are added to
every request made in the repo. A matching path rule is used together with them.

## Copy and adapt

| Kit file | Destination | Action |
| --- | --- | --- |
| [copilot-instructions.template.md](copilot-instructions.template.md) | `.github/copilot-instructions.md` | Copy, rename, fill placeholders and run every command. |
| [example-meter-platform.md](example-meter-platform.md) | Your brief draft | Use as a worked example, not a verified production brief. |
| [checklist.md](checklist.md) | Your context-change checklist | Copy unchanged or use during review; no special filename. |

Nothing in this folder is live instructions for this kit.
Merge with an existing brief rather than overwriting it. Start with one page;
GitHub's drafting guidance says no more than two pages, not task-specific, and
every build, test and lint command validated by running it.

## Validate the brief

Run commands from the stated directory in a clean checkout. Record the date and
result. Leave out one-off tasks, tone or persona rules, secrets, internal URLs
and "see the wiki" directions. Inline the few rules that matter.
Keep rules consistent with existing package and path instructions.

Ask a representative repo question in VS Code chat, then expand its References
list to check that the brief was included. Inclusion does not prove compliance.
Use the [checklist](checklist.md) before committing.

## Sources

See [instruction support and IDE configuration](../docs/references.md#copilot-and-vs-code).
