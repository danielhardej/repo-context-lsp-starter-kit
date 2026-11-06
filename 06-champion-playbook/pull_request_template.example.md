# Context Change

## Change and scope

{{WHAT_CHANGED_AND_WHY}}

| File or rule | Intended owner | When it should load |
| --- | --- | --- |
| {{FILE_OR_RULE}} | {{OWNER}} | {{LOAD_CONDITION}} |

## Validation evidence

| Check | Command or action | Result |
| --- | --- | --- |
| Destination build, test and lint | {{EXACT_COMMANDS_AND_DIRECTORY}} | {{RESULT_AND_DATE}} |
| Instruction inclusion | {{QUESTION_AND_REFERENCES_OR_INSTRUCTIONS}} | {{FILES_SEEN}} |
| Matching/non-matching paths | {{FILES_CHECKED}} | {{RESULT}} |
| CLI LSP, if changed | {{LSP_SHOW_AND_TEST_RESULTS}} | {{RESULT}} |
| Known references or rename | {{SYMBOL_AND_CHECK}} | {{RESULT}} |

## Review checklist

- [ ] All placeholders are resolved in activated files.
- [ ] Commands were run successfully; unrun checks are disclosed below.
- [ ] Each rule has one owner and does not contradict another layer.
- [ ] No secrets, customer data or internal URLs were added.
- [ ] Essential rules are inline and path globs are scoped.
- [ ] Copilot code review used this PR's head-branch instructions.
- [ ] CODEOWNERS covers `.github/` and every AGENTS.md; reviewers have been requested.
- [ ] Documentation and pilot measurements are updated where relevant.

## Limitations and reviewers

{{UNVERIFIED_CHECKS_AND_REASON}}

{{REQUESTED_REVIEWERS_AND_SCOPES}}
