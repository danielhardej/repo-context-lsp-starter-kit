# Boundary Rubric

Where each rule lives, plus the six smells.
This is workshop teaching content, not live instructions for this kit.

## Copy and use

| Kit file | Destination | Action |
| --- | --- | --- |
| This README | Your squad's context review notes | Copy as reference material; do not rename to an instruction file. |
| [triage-worksheet.md](triage-worksheet.md) | Your repo's context triage notes | Copy without renaming, then add your own rules. |

## Ownership rubric

<!-- markdownlint-disable MD013 MD033 -->

Which file owns which rule?

| If the rule is… | Put it in… | It loads… |
| --- | --- | --- |
| True for the whole repo, every task | .github/copilot-instructions.md | On every request |
| True for some paths or file types | .github/instructions/*.instructions.md | On a matching file |
| How agents work in one package | AGENTS.md in that folder | In agent sessions there |
| A repeatable task you trigger | .github/prompts/*.prompt.md | When you invoke it |
| A procedure with scripts & assets | .github/skills/<name>/SKILL.md | Automatically, when relevant |
| Only true for this one task | Your prompt — not a file | This conversation only |

Rule of thumb: typed it in three prompts? Make it a file. Only true today? Keep it in the prompt.

Six context smells — and the fix:

- The 900-line brief: Everything in one always-on file; key rules get diluted. Fix: a one-page brief; specifics move to path rules.
- Tasks in always-on files: 'Add logging to the export job' has sat in the brief for months. Fix: move it to a prompt file — or the prompt.
- Layers that contradict: The brief says Jest; the path rule says Vitest. Fix: one owner per rule; delete the duplicate.
- "Follow the wiki": Links to style guides the model may never open. Fix: inline the five rules that matter most.
- Stale commands: Build steps nobody has run since the last re-platform. Fix: validate every command; review context like code.
- Noisy search: Generated code, logs and build output flood every grep. Fix: exclude them via .gitignore or search.exclude.

<!-- markdownlint-enable MD013 MD033 -->

## Scope notes

The rubric is a placement guide, not a guarantee of instruction compliance.
Nested AGENTS.md discovery depends on the client and, for VS Code Local, its
settings; see [agent working instructions](../03-agents-md/README.md).
`search.exclude` controls VS Code search, not shell grep. `.gitignore` helps
tools that respect it; choose exclusions appropriate to the search tool.

Prompt files, skills, custom agents and MCP are
[Module 6 topics](../docs/references.md#module-hand-offs), not implemented here.
Use the [worksheet](triage-worksheet.md) to practise placement.
