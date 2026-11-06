# Verification Checklist

## See it

- [ ] Ask a representative repo question in VS Code chat.
- [ ] Expand the response's References list; check the brief and matching path rules.
- [ ] Check a non-matching file too; narrow any unexpectedly broad globs.
- [ ] Inspect behaviour as well as inclusion; instructions do not guarantee compliance.

## Test it

- [ ] In Copilot CLI run `/lsp show` or `/lsp list`.
- [ ] Run `/lsp test {{SERVER_NAME}}` for every configured server.
- [ ] After a config change run `/lsp reload`; use `/lsp logs` for failures.
- [ ] Confirm references to a known symbol and review a rename diff.
- [ ] Run the destination repo's documented build, test and lint commands.

## Review it

- [ ] Test instruction changes in the same PR: Copilot code review reads its head branch.
- [ ] Check that review rules target findings, not formatting, PR overviews or blocking merges.
- [ ] Keep essential rules inline; code review does not follow external links.
- [ ] Have a person review results and retain existing test/security controls.

## Own it

- [ ] Add CODEOWNERS for `.github/` and every root or nested AGENTS.md.
- [ ] Replace example owners with visible teams or users with explicit write access.
- [ ] Check later ownership patterns do not override context ownership.
- [ ] Request reviewers manually until the ownership file is on the PR's base branch.
- [ ] Agree who reruns command checks when tooling or architecture changes.

## Measure it

- [ ] Record Copilot usage metrics and AI Credit consumption before and after on a pilot repo.
- [ ] Use comparable periods, tasks, people and model/client versions.
- [ ] Ask the authorised metrics/billing owner for available exports and their actual scope.
- [ ] Record missing or broader-scope data as unavailable; do not invent repo attribution.
- [ ] Combine usage/cost signals with task success, test results and human review.

Use the [blank metrics sheet](before-after-metrics.md) and
[official sources](../docs/references.md#ownership-and-measurement).
