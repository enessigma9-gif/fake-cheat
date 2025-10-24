
# Fake Cheat Menu - Auto Builder and Runner for Windows
Write-Host "==== Fake Cheat Menu Auto-Setup ====" -ForegroundColor Cyan

# Check Node.js
if (!(Get-Command npm -ErrorAction SilentlyContinue)) {
    Write-Host "Node.js (npm) is not installed. Please install from https://nodejs.org/ and re-run this script." -ForegroundColor Red
    exit 1
}

# Install dependencies if node_modules doesn't exist
if (!(Test-Path "node_modules")) {
    Write-Host "Installing dependencies..." -ForegroundColor Yellow
    npm install
}

# Ask user if they want to build or run
Write-Host ""
$choice = Read-Host "Do you want to (1) run demo or (2) build Windows EXE? Enter 1 or 2"

switch ($choice) {
    1 {
        Write-Host "Starting Fake Cheat Menu..." -ForegroundColor Green
        npm start
    }
    2 {
        Write-Host "Building Windows EXE..." -ForegroundColor Green
        npm run dist
        Write-Host "Build complete! Check the 'dist' folder for your installer (.exe)." -ForegroundColor Cyan
    }
    default {
        Write-Host "Invalid choice. Exiting." -ForegroundColor Red
    }
}
