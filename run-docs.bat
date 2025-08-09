@echo off
setlocal

set PORT=%1
if "%PORT%"=="" set PORT=3000

echo Starting Mintlify docs on port %PORT%...
pushd "%~dp0docs"

where node >nul 2>nul
if errorlevel 1 (
  echo Node.js is not installed. Please install Node 19+ from https://nodejs.org/
  popd
  exit /b 1
)

npx --yes mintlify@latest dev --port %PORT%

popd
endlocal

