# LSP Troubleshooting

Use these commands inside Copilot CLI, not a shell or VS Code chat.
VS Code uses its editor language services, not this configuration.

## First checks

| Check | Action |
| --- | --- |
| Configuration visible | `/lsp show` or `/lsp list` |
| Server can start | `/lsp test {{SERVER_NAME}}` |
| Failure details | `/lsp logs`; inspect executable, arguments and handshake errors. |
| Configuration edited | `/lsp reload`, then repeat the test. |
| Available commands | `/lsp help` |
| Folder trust | Confirm you trust the working folder; relevant servers start in the background after trust. |
| Installation | Ensure the executable is on PATH in the terminal that launches CLI. |

`/lsp test` starts a temporary standalone instance and then stops it. A passing
test proves startup, not accurate indexing of all project files. Check references
to a known symbol and review any rename diff before running the repo's tests.

## Monorepo roots

`rootUri` is relative to the Git root and defaults to `.`. The
[sample Python server](lsp.template.json) uses `jobs`, not the whole monorepo.
Change it if that directory does not exist in your repo. Keep the Python project
configuration at the relevant root. `cwd` controls the launch working directory;
it is not a substitute for the server's project root.

For Java, keep the JDT LS data directory unique to the workspace. For C#, choose
the intended solution root. For Go, include the relevant module or workspace.
For Terraform, use its module root and do not map generic `.hcl` or Terraform
JSON files to this fragment; the official server uses specific language IDs.

## Timeouts and fields

| Field | Use |
| --- | --- |
| `requestTimeoutMs` | Requests; default 90,000 ms (90 seconds). |
| `initializationTimeoutMs` | Startup handshake; default 60,000 ms (60 seconds). |
| `spawnTimeoutMs` | Process spawn timeout; set only after diagnosing spawn failures. |
| `warmupTimeoutMs` | Warmup timeout; tune only after reviewing logs. |

Check PATH, runtime versions and roots before increasing timeouts. No documented
default is assumed here for spawn or warmup.

A server needs `fileExtensions` and at least one of `command`, `bash` or
`powershell`. Other documented fields are `args`, `cwd`, `env`, `rootUri` and
`initializationOptions`, plus the timeouts above. `env` supports `${VAR}` and
`${VAR:-default}`. Server names use only letters, digits, `_` and `-`.
Do not add fields copied from an editor's unrelated LSP configuration format.

## Disable a server

Place this in the destination repository's `.github/lsp.json` to disable the
existing `typescript` server for everyone, including lower-priority plugin or
user definitions with that name:

```json
{
  "lspServers": {
    "typescript": { "disabled": true }
  }
}
```

Merge the entry without deleting other servers, then run `/lsp reload`.
Priority is project, plugin, user, highest to lowest.

## Sources

See [setup and server references](../docs/references.md) and
[copying instructions](README.md).
