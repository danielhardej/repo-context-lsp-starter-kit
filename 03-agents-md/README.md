# Agent Working Instructions

Commands, definition of done, boundaries.
Everything here is inert template content, not agent instructions for this kit.

## Copy and rename

| Kit file | Destination | Adaptation |
| --- | --- | --- |
| [AGENTS.root.template.md](AGENTS.root.template.md) | `AGENTS.md` at repo root | Replace command, boundary and reviewer placeholders. |
| [AGENTS.package.template.md](AGENTS.package.template.md) | `{{PACKAGE_PATH}}/AGENTS.md` | Add only that folder's differences. |

Replace every placeholder, then run the commands from their stated directory.
The command blocks become copy-paste ready only after this step. Do not claim
validation until someone has actually run them in the destination repository.

For the meter-platform root, candidate replacements are:

| Placeholder | Worked-example value |
| --- | --- |
| `{{COMMAND_DIRECTORY}}` | Repository root |
| `{{SETUP_COMMAND}}` | `npm ci` |
| `{{BUILD_COMMAND}}` | `npm run build` |
| `{{TEST_COMMAND}}` | `npm test -- --run` |
| `{{LINT_COMMAND}}` | `npm run lint` |

<!-- TODO: verify -->
Run those candidate commands in
[meter-platform](https://github.com/danielhardej/meter-platform) before use.

## Readers and combination

Copilot CLI, the cloud agent, code review and VS Code read AGENTS.md.
CLAUDE.md and GEMINI.md also work as Copilot agent-instruction formats;
code review also reads REVIEW.md. Check the selected VS Code harness's support
before choosing alternative formats.

Copilot CLI and VS Code's Copilot agent discover AGENTS.md at the repo root,
working directory, folders between them and along paths to files being changed.
Applicable instructions are combined with no general precedence order. A package
file adds local detail; it must never contradict root instructions or the brief.

Consolidate shared CLAUDE.md or GEMINI.md guidance into AGENTS.md where all your
tools support it. Remove duplicates only after checking those tools. If separate
files remain necessary, keep their shared rules consistent; do not assume a
Markdown link includes the other file automatically.

## VS Code Local settings

These settings govern the Local agent, not Copilot CLI discovery:

```json
{
  "chat.useAgentsMdFile": true,
  "chat.useNestedAgentsMdFiles": true
}
```

The first enables the root file. Nested files require both settings; nested
discovery is experimental and off by default. Check inclusion in a representative
session instead of assuming settings guarantee that rules are followed.

## CLI checks and other layers

- Use `/instructions` to list discovered files and enable or disable individual ones.
- After editing instructions, start a new session with `/new`, or exit and resume one.
- In copilot-instructions.md, AGENTS.md or CLAUDE.md, `@relative/path` includes another file in CLI.
- `@` inclusion does not expand inside `*.instructions.md`; keep essential path rules inline.
- CLI personal instructions live in `~/.copilot/copilot-instructions.md` and `~/.copilot/instructions/`.

Organisation instructions are set on GitHub.com, not in a repository file. They
are used by Copilot Chat on GitHub.com, the cloud agent and code review. Do not
assume organisation settings replace repo rules or propagate to every client.

## Different from custom agents

`.github/agents/` holds custom agent definitions, not package AGENTS.md files.
See the [Module 6 hand-off](../docs/references.md#module-hand-offs).
Use the [official references](../docs/references.md#copilot-and-vs-code) to recheck support.
