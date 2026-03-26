param()

$ErrorActionPreference = "Stop"

# If a venv is already active, try to deactivate it before switching.
if ($env:VIRTUAL_ENV) {
  $deactivateCmd = Get-Command "deactivate" -ErrorAction SilentlyContinue
  if ($deactivateCmd) {
    try {
      deactivate
    } catch {
      # If something goes wrong with deactivation, continue to attempt activation.
      Write-Host "Warning: existing venv couldn't be cleanly deactivated: $($_.Exception.Message)"
    }
  } else {
    Write-Host "Warning: VIRTUAL_ENV is set ($env:VIRTUAL_ENV) but deactivate() is not available."
    Write-Host "         You may need to close/reopen the PowerShell session to fully switch venvs."
  }
}

$repoRoot = $PSScriptRoot
$envName = "imaging-env"
$envDir = Join-Path $repoRoot $envName
$activateScript = Join-Path $envDir "Scripts/Activate.ps1"

if (-not (Test-Path $activateScript)) {
  throw "Missing venv at '$envDir'. Run '.\setup_envs.ps1' from the repo root first."
}

. $activateScript

Write-Host "Activated venv: $envName"

