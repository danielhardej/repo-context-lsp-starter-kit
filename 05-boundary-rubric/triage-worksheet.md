# Context Triage Worksheet

## Five meter-platform examples

| Rule | Home | Loads | Why |
| --- | --- | --- | --- |
| Never log NMIs or customer PII | The brief: `.github/copilot-instructions.md` | On every repo request | Privacy applies across services, jobs and web code. |
| Readings routes must validate input with zod | A path rule: `.github/instructions/api.instructions.md` | On matching readings route files | This requirement belongs to the API boundary. |
| Run npm run verify before opening a PR | `services/readings/AGENTS.md` | In applicable agent sessions; client discovery applies | This package's verification command belongs with its workflow. |
| Rename the export job to nightly-export | The prompt | This conversation only | A one-off rename is not a lasting repo rule. |
| Add logging to the export job | A prompt file, or the prompt | When invoked, or this conversation only | Use a prompt file only if the task is repeatable. |

<!-- TODO: verify -->
`npm run verify` is an illustrative package command, not confirmed to exist in
[meter-platform](https://github.com/danielhardej/meter-platform).
Check the package scripts and run it from `services/readings` before adopting it.

## Your squad's rules

| Rule | Home | Loads | Why |
| --- | --- | --- | --- |
| {{RULE_1}} | {{HOME_1}} | {{LOAD_CONDITION_1}} | {{REASON_1}} |
| {{RULE_2}} | {{HOME_2}} | {{LOAD_CONDITION_2}} | {{REASON_2}} |
| {{RULE_3}} | {{HOME_3}} | {{LOAD_CONDITION_3}} | {{REASON_3}} |

Check each placement against the [rubric](README.md#ownership-rubric).
If two files own the same rule, choose one owner and remove the duplicate.
