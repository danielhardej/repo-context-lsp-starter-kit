# References

## Copilot and VS Code

<!-- markdownlint-disable MD013 -->

- [Instruction support](https://docs.github.com/en/copilot/reference/custom-instructions-support) — supported surfaces.
- [IDE instructions](https://docs.github.com/en/copilot/how-tos/copilot-in-your-ide/customize-copilot/configure-custom-instructions/add-repository-instructions-in-your-ide) — briefs, globs and References.
- [CLI instructions](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-custom-instructions) — discovery, combination and file references.
- [Code review](https://docs.github.com/en/copilot/tutorials/customize-code-review) — head-branch loading and limitations.
- [LSP concepts](https://docs.github.com/en/copilot/concepts/customizations/lsp-servers) — priority and background startup.
- [LSP setup](https://docs.github.com/en/copilot/how-tos/copilot-cli/set-up-copilot-cli/add-lsp-servers) — fields, installation and commands.
- [VS Code instruction reference](https://code.visualstudio.com/docs/agents/reference/custom-instructions-reference) — harness-specific discovery and settings.
- [Awesome Copilot LSP search](https://awesome-copilot.github.com/skills/?q=lsp) — community lsp-setup skill.

Checked on 6 November 2026. Where older IDE prose suggests nearest-file precedence,
use the current CLI and VS Code references: applicable Copilot instructions are
combined without a general precedence order. Package guidance must not contradict
root guidance. Product behaviour may change; recheck before each workshop.

## Validation tooling

- [markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2) — installation, globs and supported configuration names.

<!-- markdownlint-enable MD013 -->

## Language servers and installation

<!-- markdownlint-disable MD013 -->

- [TypeScript Language Server](https://github.com/typescript-language-server/typescript-language-server) — npm installation and `--stdio` launch.
- [Pyright](https://github.com/microsoft/pyright) — Microsoft's Python checker; CLI setup documents `pyright-langserver --stdio`.
- [Eclipse JDT LS](https://github.com/eclipse-jdtls/eclipse.jdt.ls) — Python launcher, Java runtime and standard-stream transport.
- [JDT LS 1.63.0](https://download.eclipse.org/jdtls/milestones/1.63.0/) — pinned milestone archive and SHA256.
- [csharp-ls](https://github.com/razzmatazz/csharp-language-server) — .NET tool installation and launch.
- [csharp-ls releases](https://github.com/razzmatazz/csharp-language-server/releases) — 0.28.0 release pin.
- [Go gopls](https://go.dev/gopls) — official module installation and supported toolchains.
- [gopls v0.24.0](https://go.dev/gopls/release/v0.24.0.md) — release pin.
- [Terraform LS installation](https://github.com/hashicorp/terraform-ls/blob/main/docs/installation.md) — archives and checksum verification.
- [Terraform LS usage](https://github.com/hashicorp/terraform-ls/blob/main/docs/USAGE.md) — `terraform-ls serve` and language IDs.
- [Terraform LS releases](https://releases.hashicorp.com/terraform-ls/0.39.1/) — pinned platform archives.
- [.NET tool install](https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-tool-install) — version, source and installation-path flags.
- [Dev container reference](https://containers.dev/implementors/json_reference/) — lifecycle commands and environment substitution.

<!-- markdownlint-enable MD013 -->

## Module hand-offs

- Module 2: `/plan`; no planning workflow is implemented in this kit.
- Module 6: prompt files, skills, custom agents and MCP; this kit links forward only.

Workshop material URLs have not been supplied. Use these named hand-offs rather
than inventing links to AGL's knowledge library.

## Ownership and measurement

<!-- markdownlint-disable MD013 -->

- [Code owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners) — patterns, access, precedence and base-branch loading.
- [PR templates](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/creating-a-pull-request-template-for-your-repository) — filenames and default-branch availability.
- [Copilot usage metrics](https://docs.github.com/en/copilot/concepts/copilot-metrics) — usage evidence, reporting scopes, telemetry limitations and AI Credit-based dashboard estimates.

<!-- markdownlint-enable MD013 -->

For AI Credit consumption, ask the authorised owner for the report available to
your account and confirm attribution. This kit does not assume a repo-level
billing endpoint, permission or export schema.
