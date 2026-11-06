# Copilot CLI Language Servers

Server definitions for AGL's main languages. These files are inert here.
`.github/lsp.json` configures Copilot CLI, not VS Code. VS Code agents use the
editor's own language services, including the usages tool.

## Copy and rename

| Kit file | Destination | Action |
| --- | --- | --- |
| [lsp.template.json](lsp.template.json) | `.github/lsp.json` | Copy and rename; adapt Python `rootUri` if your jobs live elsewhere. |
| [servers/java.template.json](servers/java.template.json) | Existing `.github/lsp.json` | Merge its named entry into `lspServers`; fill all placeholders. |
| [servers/csharp.template.json](servers/csharp.template.json) | Existing `.github/lsp.json` | Merge its named entry; choose the solution root. |
| [servers/go.template.json](servers/go.template.json) | Existing `.github/lsp.json` | Merge its named entry; choose the module/workspace root. |
| [servers/terraform.template.json](servers/terraform.template.json) | Existing `.github/lsp.json` | Merge its named entry; choose the Terraform module root. |
| [install-language-servers.sh](install-language-servers.sh) | `scripts/install-language-servers.sh` | Copy unchanged; run explicitly with bash. |
| [install-language-servers.ps1](install-language-servers.ps1) | `scripts/install-language-servers.ps1` | Copy unchanged; run explicitly with PowerShell. |
| [devcontainer-snippet.template.json](devcontainer-snippet.template.json) | `.devcontainer/devcontainer.json` | Merge fields, not a replacement file; fill the script path. |
| [troubleshooting.md](troubleshooting.md) | Your developer notes | Read here or copy; no required rename. |

Do not overwrite existing servers or lifecycle commands. Fragments each contain
an outer `lspServers` object: merge the entries inside it, not the outer objects.
Keep the Bash script's LF line endings; use `*.sh text eol=lf` in the destination
`.gitattributes` if its checkout would otherwise convert scripts to CRLF.
Use `.` for a project at the Git root. The Python sample uses `jobs`, as in
[meter-platform](https://github.com/danielhardej/meter-platform).
Its pyright strict mode belongs in the destination Python configuration;
`rootUri` alone does not enable strict checking.

## Pinned installs and official launch commands

| Server | Pin and source | Launch command | Verify with /lsp test |
| --- | --- | --- | --- |
| TypeScript | TypeScript 5.9.3 + typescript-language-server 5.0.0; npm | `typescript-language-server --stdio` | `/lsp test typescript` |
| Python | pyright 1.1.407; Microsoft's npm package | `pyright-langserver --stdio` | `/lsp test python` |
| Java | JDT LS 1.63.0; Eclipse milestone archive | `jdtls -configuration {{CONFIG_DIR}} -data {{WORKSPACE_DIR}}` | `/lsp test java` |
| C#/.NET | csharp-ls 0.28.0; maintainer's NuGet package | `csharp-ls` | `/lsp test csharp` |
| Go | gopls v0.24.0; Go team's module | `gopls` | `/lsp test go` |
| Terraform | terraform-ls 0.39.1; HashiCorp release archive | `terraform-ls serve` | `/lsp test terraform` |

<!-- TODO: verify -->
Commands and pins are source-checked, not live-tested with each squad's project.
Run every applicable `/lsp test` after copying. Startup success does not prove
references or renames are complete; exercise a known symbol too.
Recheck pins and advisories before rollout. Exact top-level pins do not lock all
npm, Go or NuGet transitive packages; use a reviewed dev container for repeatability.

Prerequisites: Node 20+ for core servers, Python 3.12 for the sample jobs, Python
3.9+ for the JDT LS wrapper, Java 25+ for current JDT LS, .NET 10 SDK for csharp-ls,
and a supported Go toolchain for gopls. Install runtimes through your approved
process; these scripts do not install runtimes or Copilot CLI.
csharp-ls and typescript-language-server are community servers, not Microsoft products.

## Run an installer

After copying into the destination repo, install just the languages you need:

```sh
bash scripts/install-language-servers.sh core
bash scripts/install-language-servers.sh go
bash scripts/install-language-servers.sh csharp
```

```powershell
./scripts/install-language-servers.ps1 -Language core
./scripts/install-language-servers.ps1 -Language go
./scripts/install-language-servers.ps1 -Language csharp
```

The default is core (TypeScript and Python). Installs go under
`$HOME/.local/share/agl-lsp`, without elevation. Core installs disable npm
lifecycle scripts and use npm's public registry. Go uses the public Go module
proxy and checksum database; NuGet uses only its official public feed.
Use an organisation-approved mirror instead only after reviewing the script.
An existing csharp-ls install causes a safe failure; review updates manually.

For Java, download `jdt-language-server-1.63.0-202610191322.tar.gz` and its SHA256
from the [Eclipse milestone directory](https://download.eclipse.org/jdtls/milestones/1.63.0/).
For Terraform, download the matching OS/architecture archive and SHA256SUMS from
the [HashiCorp release directory](https://releases.hashicorp.com/terraform-ls/0.39.1/).
Check the publisher and checksum before passing a local archive to either script:

```sh
bash scripts/install-language-servers.sh java "{{JDTLS_ARCHIVE}}" "{{APPROVED_SHA256}}"
bash scripts/install-language-servers.sh terraform "{{TERRAFORM_LS_ARCHIVE}}" "{{APPROVED_SHA256}}"
```

```powershell
./scripts/install-language-servers.ps1 -Language java -Archive '{{JDTLS_ARCHIVE}}' -Sha256 '{{APPROVED_SHA256}}'
./scripts/install-language-servers.ps1 -Language terraform -Archive '{{TERRAFORM_LS_ARCHIVE}}' -Sha256 '{{APPROVED_SHA256}}'
```

The scripts reject wrong archive names, missing checksums and checksum mismatches.
They do not fetch and execute remote scripts. The Java fragment invokes the
official Python `bin/jdtls` wrapper explicitly: choose `python3` or `python`, use
the absolute install directory and absolute writable configuration/data paths,
and keep the data directory unique per workspace. Do not set JDT LS socket or
pipe variables; the server falls back to standard streams without them.

## PATH and dev container

Set PATH in the terminal that will launch Copilot CLI:

```sh
export PATH="$HOME/.local/share/agl-lsp/npm/bin:$HOME/.local/share/agl-lsp/bin:$PATH"
```

```powershell
$env:PATH = "$HOME/.local/share/agl-lsp/npm;$HOME/.local/share/agl-lsp/bin;$env:PATH"
```

The dev container snippet targets a Linux container with bash, Node 20+ and a
defined HOME. Set `{{INSTALL_SCRIPT_PATH}}` to `scripts/install-language-servers.sh`.
Merge it into your existing configuration and retain existing lifecycle work.
Add the required runtimes and optional-language install steps to your approved
container image; do not assume a Windows host's tools exist inside the container.

## Priority and checks

Highest priority first: `.github/lsp.json`, plugin servers, then
`~/.copilot/lsp-config.json`. A higher-priority entry wins for the same server name.
Configuration installs nothing. Relevant servers start automatically in the
background once the working folder is trusted.

In Copilot CLI run `/lsp reload`, `/lsp show` (or `/lsp list`), then the tests in
the table. Use `/lsp logs` for failures and `/lsp help` for command help.
See [troubleshooting](troubleshooting.md).

The [lsp-setup skill](https://awesome-copilot.github.com/skills/?q=lsp) automates
popular languages. Review its sources before installing; skill authoring remains
a [Module 6 topic](../docs/references.md#module-hand-offs).
See [official server sources](../docs/references.md#language-servers-and-installation).
