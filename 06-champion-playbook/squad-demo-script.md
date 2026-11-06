# Ten-minute Squad Demo

Use [meter-platform](https://github.com/danielhardej/meter-platform):
TypeScript 5, Node 20, Fastify, Vitest and zod; Python 3.12 jobs.
Work with synthetic readings such as `TEST000001`, never customer records.

## Prepare before the session

<!-- TODO: verify -->
Prepare and check `main`, `layered-context` and `with-lsp` in the sample repo.
On 6 November 2026, `git ls-remote --heads` advertised none of these branches.
This kit does not create them. Check `validateReading` exists and record the
actual callers; do not script an invented caller count or test result.

- Use a disposable, clean sample checkout and validate its install/test commands.
- Keep application code identical across demo branches; vary only context/LSP set-up.
- Make `main` the baseline and `layered-context` the brief/path/package-instruction version.
- Make `with-lsp` add `.github/lsp.json`; install servers and check `/lsp test typescript`.
- Use Copilot CLI for the LSP comparison; keep the model, task and client version constant.
- Start a fresh CLI session after branch changes so instruction edits are loaded.
- If demonstrating VS Code too, use References to show instructions; its language services already exist.

## 0–2 minutes: main

Switch to the sample's `main` branch. In Copilot CLI ask:

```text
Who calls validateReading, and what would break if I renamed it to assertValidReading?
```

Record the reported callers and evidence, missed references and elapsed time.
Do not imply a baseline has no language intelligence; check `/lsp show` for
user/plugin servers and disclose them. Record relevant `/instructions` entries.

## 2–4 minutes: layered-context

Switch to `layered-context` and start a new CLI session. Show the brief, two path
rules and a package AGENTS.md. Use `/instructions` to confirm the files in use.
Repeat the exact first prompt; compare evidence and observance of the guardrails.
Keep the answer to the same question so context is the main changed variable.

## 4–8 minutes: with-lsp

Switch to `with-lsp` and start a new session. Show `/lsp show`, run
`/lsp test typescript` and explain that the JSON installed nothing.
Repeat the first prompt, then ask:

```text
Rename validateReading to assertValidReading across the repo, then run npm test
```

Inspect the diff for definition, imports and callers. Check the tool activity
for semantic references/rename rather than assuming LSP was used.
Review the test output. If `npm test` watches, stop it and run the sample's
validated one-shot command `npm test -- --run`; report the actual result.

## 8–10 minutes: compare and hand off

Compare caller coverage, rename completeness, tests, corrections and time.
Do not claim that one successful run proves reliability or a cost saving.
Use the [metrics sheet](before-after-metrics.md) for recorded observations and
the [verification checklist](verification-checklist.md) for squad adoption.
Leave the sample change on a disposable demo branch; do not push it as part of this kit.

`/plan` belongs to [Module 2](../docs/references.md#module-hand-offs);
prompt files, skills, custom agents and MCP belong to Module 6.
