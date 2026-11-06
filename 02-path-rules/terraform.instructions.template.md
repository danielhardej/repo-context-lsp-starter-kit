---
applyTo: "{{TERRAFORM_GLOBS}}"
---

# Terraform Rules

- Reuse approved modules in `{{TERRAFORM_MODULE_PATH}}`.
- Keep provider and module versions explicitly constrained.
- Keep secrets out of configuration, variable files and outputs.
- Never commit or edit Terraform state or saved plan files.
- Follow `{{INFRA_CHANGE_APPROVAL_PROCESS}}` before applying infrastructure changes.
