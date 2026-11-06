# Working on {{REPO_NAME}}

## Commands

Run from `{{COMMAND_DIRECTORY}}`. These commands were validated on `{{VALIDATED_DATE}}`.

Set-up:

```sh
{{SETUP_COMMAND}}
```

Build:

```sh
{{BUILD_COMMAND}}
```

Test:

```sh
{{TEST_COMMAND}}
```

Lint:

```sh
{{LINT_COMMAND}}
```

## Definition of done

- Tests pass, including focused coverage for changed behaviour.
- Lint is clean and the build succeeds.
- Relevant documentation is updated.
- Document commands and results in the PR; disclose any checks that could not run.

## Boundaries

- Never touch generated code in `{{GENERATED_PATHS}}`; change its source instead.
- Never read, expose or edit secrets in `{{SECRET_PATHS}}`.
- Never touch infrastructure state in `{{INFRA_STATE_PATHS}}`.
- Stop and hand off if the requested change requires crossing these boundaries.

## Hand-off

- Name branches `{{BRANCH_PREFIX}}/{{SHORT_DESCRIPTION}}`.
- Use the PR template at `{{PR_TEMPLATE_PATH}}`.
- Request `{{SERVICE_REVIEWERS}}` for service changes and `{{DOMAIN_REVIEWERS}}` for domain logic.
- Request `{{CONTEXT_REVIEWERS}}` for instruction changes and `{{INFRA_REVIEWERS}}` for infrastructure.
