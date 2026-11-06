#!/usr/bin/env bash
set -euo pipefail

language="${1:-core}"
base="$HOME/.local/share/agl-lsp"

require() {
  command -v "$1" >/dev/null || { printf 'Required command missing: %s\n' "$1" >&2; exit 1; }
}

verify_archive() {
  local archive="$1" expected="$2" actual
  [[ "$expected" =~ ^[[:xdigit:]]{64}$ ]] || { printf 'Supply an approved SHA256 checksum.\n' >&2; exit 1; }
  if command -v sha256sum >/dev/null; then
    actual="$(sha256sum "$archive")"
  else
    require shasum
    actual="$(shasum -a 256 "$archive")"
  fi
  [[ "${actual%% *}" == "$expected" ]] || { printf 'Checksum mismatch.\n' >&2; exit 1; }
}

case "$language" in
  core)
    require node
    require npm
    node -e 'if (Number(process.versions.node.split(".")[0]) < 20) process.exit(1)'
    npm install --global --ignore-scripts --registry=https://registry.npmjs.org \
      --prefix "$base/npm" typescript@5.9.3 typescript-language-server@5.0.0 pyright@1.1.407
    ;;
  go)
    require go
    mkdir -p "$base/bin"
    GOBIN="$base/bin" GOPROXY=https://proxy.golang.org GOSUMDB=sum.golang.org \
      go install golang.org/x/tools/gopls@v0.24.0
    ;;
  csharp)
    require dotnet
    dotnet tool install csharp-ls --tool-path "$base/bin" --version 0.28.0 \
      --source https://api.nuget.org/v3/index.json
    ;;
  java)
    require tar
    archive="${2:?Supply the downloaded JDT LS 1.63.0 archive path}"
    [[ "$(basename "$archive")" == 'jdt-language-server-1.63.0-202610191322.tar.gz' ]] || exit 1
    verify_archive "$archive" "${3:?Supply its approved SHA256 checksum}"
    [[ ! -e "$base/java" ]] || { printf 'Java installation already exists; review it manually.\n' >&2; exit 1; }
    mkdir -p "$base/java"
    tar -xzf "$archive" -C "$base/java"
    ;;
  terraform)
    require unzip
    archive="${2:?Supply a downloaded Terraform LS 0.39.1 platform archive path}"
    [[ "$(basename "$archive")" == terraform-ls_0.39.1_*.zip ]] || exit 1
    verify_archive "$archive" "${3:?Supply its approved SHA256 checksum}"
    mkdir -p "$base/bin"
    [[ ! -e "$base/bin/terraform-ls" ]] || { printf 'Terraform LS already exists; review it manually.\n' >&2; exit 1; }
    unzip "$archive" -d "$base/bin"
    ;;
  --help)
    printf 'Usage: bash install-language-servers.sh [core|go|csharp|java|terraform] [archive] [sha256]\n'
    ;;
  *) printf 'Unknown language: %s\n' "$language" >&2; exit 1 ;;
esac

printf 'Installation directory: %s\nAdd its npm/bin and bin directories to PATH before starting Copilot CLI.\n' "$base"