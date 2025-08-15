# GHOST HIT SYSTEM - RUN SCRIPT (PowerShell)
# Run this script as Administrator for best results

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   GHOST HIT SYSTEM - RUN SCRIPT" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if executable exists
$exePath = $null

if (Test-Path "build\bin\GhostHitSystem.exe") {
    $exePath = "build\bin\GhostHitSystem.exe"
    Write-Host "✅ Found GhostHitSystem.exe in build\bin\" -ForegroundColor Green
} elseif (Test-Path "GhostHitSystem.exe") {
    $exePath = "GhostHitSystem.exe"
    Write-Host "✅ Found GhostHitSystem.exe in current directory" -ForegroundColor Green
} else {
    Write-Host "❌ GhostHitSystem.exe not found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please build the project first using:" -ForegroundColor Yellow
    Write-Host "  1. build.bat (Windows Batch)" -ForegroundColor White
    Write-Host "  2. build.ps1 (PowerShell)" -ForegroundColor White
    Write-Host "  3. Or open GhostHitSystem.sln in Visual Studio" -ForegroundColor White
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "🚀 Starting Ghost Hit System..." -ForegroundColor Green
Write-Host "⚠️  IMPORTANT: Run as Administrator for best results!" -ForegroundColor Yellow
Write-Host ""

$continue = Read-Host "Press Enter to continue or 'n' to exit"
if ($continue -eq "n" -or $continue -eq "N") {
    exit 0
}

# Check if running as Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if ($isAdmin) {
    Write-Host "✅ Running as Administrator - Starting program..." -ForegroundColor Green
    Start-Process $exePath
} else {
    Write-Host "⚠️  Not running as Administrator - Attempting to elevate..." -ForegroundColor Yellow
    try {
        Start-Process $exePath -Verb RunAs
        Write-Host "✅ Program started with elevated privileges" -ForegroundColor Green
    } catch {
        Write-Host "❌ Failed to start with elevated privileges" -ForegroundColor Red
        Write-Host "Please run this script as Administrator" -ForegroundColor Yellow
        Read-Host "Press Enter to exit"
    }
}

Write-Host ""
Write-Host "Ghost Hit System started!" -ForegroundColor Green
Write-Host "Use Ctrl + G to activate the system" -ForegroundColor Cyan
Write-Host "Use Ctrl + ESC to exit" -ForegroundColor Cyan