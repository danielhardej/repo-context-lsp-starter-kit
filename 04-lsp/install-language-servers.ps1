param(
    [ValidateSet('core', 'go', 'csharp', 'java', 'terraform', 'help')]
    [string]$Language = 'core',
    [string]$Archive,
    [string]$Sha256
)

$ErrorActionPreference = 'Stop'
$base = Join-Path $HOME '.local/share/agl-lsp'

function Invoke-Checked {
    param([string]$Executable, [string[]]$Arguments)
    & $Executable @Arguments
    if ($LASTEXITCODE -ne 0) { throw "$Executable failed with exit code $LASTEXITCODE" }
}

function Test-Archive {
    if ($Sha256 -notmatch '^[0-9a-fA-F]{64}$') { throw 'Supply an approved SHA256 checksum.' }
    if (-not (Test-Path -LiteralPath $Archive -PathType Leaf)) { throw 'Archive not found.' }
    if ((Get-FileHash -LiteralPath $Archive -Algorithm SHA256).Hash -ine $Sha256) {
        throw 'Checksum mismatch.'
    }
}

switch ($Language) {
    'core' {
        Invoke-Checked node @('-e', 'if (Number(process.versions.node.split(".")[0]) < 20) process.exit(1)')
        Invoke-Checked npm @('install', '--global', '--ignore-scripts', '--registry=https://registry.npmjs.org',
            '--prefix', (Join-Path $base 'npm'), 'typescript@5.9.3',
            'typescript-language-server@5.0.0', 'pyright@1.1.407')
    }
    'go' {
        $savedBin = $env:GOBIN
        $savedProxy = $env:GOPROXY
        $savedSumDb = $env:GOSUMDB
        try {
            $env:GOBIN = Join-Path $base 'bin'
            $env:GOPROXY = 'https://proxy.golang.org'
            $env:GOSUMDB = 'sum.golang.org'
            New-Item -ItemType Directory -Path $env:GOBIN -Force | Out-Null
            Invoke-Checked go @('install', 'golang.org/x/tools/gopls@v0.24.0')
        } finally {
            $env:GOBIN = $savedBin
            $env:GOPROXY = $savedProxy
            $env:GOSUMDB = $savedSumDb
        }
    }
    'csharp' {
        Invoke-Checked dotnet @('tool', 'install', 'csharp-ls', '--tool-path', (Join-Path $base 'bin'),
            '--version', '0.28.0', '--source', 'https://api.nuget.org/v3/index.json')
    }
    'java' {
        if ((Split-Path $Archive -Leaf) -ne 'jdt-language-server-1.63.0-202610191322.tar.gz') {
            throw 'Use the pinned JDT LS 1.63.0 archive.'
        }
        Test-Archive
        $destination = Join-Path $base 'java'
        if (Test-Path $destination) { throw 'Java installation already exists; review it manually.' }
        New-Item -ItemType Directory -Path $destination | Out-Null
        Invoke-Checked tar @('-xzf', $Archive, '-C', $destination)
    }
    'terraform' {
        if ((Split-Path $Archive -Leaf) -notlike 'terraform-ls_0.39.1_*.zip') {
            throw 'Use a pinned Terraform LS 0.39.1 platform archive.'
        }
        Test-Archive
        $destination = Join-Path $base 'bin'
        if (Test-Path (Join-Path $destination 'terraform-ls.exe')) {
            throw 'Terraform LS already exists; review it manually.'
        }
        New-Item -ItemType Directory -Path $destination -Force | Out-Null
        Expand-Archive -LiteralPath $Archive -DestinationPath $destination
    }
    'help' {
        Write-Output 'Usage: ./install-language-servers.ps1 -Language core|go|csharp|java|terraform [-Archive path -Sha256 hash]'
    }
}

Write-Output "Installation directory: $base"
Write-Output 'Add its npm and bin directories to PATH before starting Copilot CLI on Windows.'