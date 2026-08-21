param(
    [switch]$Force
)

$ErrorActionPreference = "Stop"
$SkillName = "kncb-player-eligibility"
$SourceDirectory = $PSScriptRoot

if ($env:CODEX_HOME) {
    $CodexDirectory = $env:CODEX_HOME
} else {
    $CodexDirectory = Join-Path $env:USERPROFILE ".codex"
}

$SkillsDirectory = Join-Path $CodexDirectory "skills"
$DestinationDirectory = Join-Path $SkillsDirectory $SkillName

if (Test-Path -LiteralPath $DestinationDirectory) {
    if (-not $Force) {
        throw "The skill is already installed at '$DestinationDirectory'. Run with -Force only if you intend to replace it."
    }

    Remove-Item -LiteralPath $DestinationDirectory -Recurse -Force
}

New-Item -ItemType Directory -Path $SkillsDirectory -Force | Out-Null
Copy-Item -LiteralPath $SourceDirectory -Destination $DestinationDirectory -Recurse

Write-Host "Installed $SkillName at $DestinationDirectory"
Write-Host "Start a new Codex task and invoke: `$kncb-player-eligibility"

