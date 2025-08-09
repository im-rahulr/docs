Param(
  [int]$Port = 3000
)

$ErrorActionPreference = 'Stop'

Write-Host "Starting Mintlify docs on port $Port..." -ForegroundColor Cyan

Push-Location "$PSScriptRoot\docs"
try {
  # Ensure npx is available
  $nodeVersion = node --version 2>$null
  if (-not $nodeVersion) {
    Write-Error "Node.js is not installed. Please install Node 19+ from https://nodejs.org/."
    exit 1
  }

  # Run without using '&&' so it works in PowerShell
  npx --yes mintlify@latest dev --port $Port
}
finally {
  Pop-Location
}

