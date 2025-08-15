# GHOST HIT SYSTEM - BUILD SCRIPT (PowerShell)
# Run this script as Administrator for best results

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   GHOST HIT SYSTEM - BUILD SCRIPT" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if CMake is installed
try {
    $cmakeVersion = cmake --version 2>$null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ CMake found: $($cmakeVersion.Split("`n")[0])" -ForegroundColor Green
    } else {
        throw "CMake not found"
    }
} catch {
    Write-Host "❌ ERROR: CMake is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install CMake from: https://cmake.org/download/" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

# Check if Visual Studio is available
$generator = "MinGW Makefiles"
try {
    $vsPath = Get-Command cl -ErrorAction SilentlyContinue
    if ($vsPath) {
        Write-Host "✅ Visual Studio compiler found" -ForegroundColor Green
        $generator = "Visual Studio 17 2022"
    } else {
        Write-Host "ℹ️  Using MinGW compiler" -ForegroundColor Yellow
    }
} catch {
    Write-Host "ℹ️  Using MinGW compiler" -ForegroundColor Yellow
}

# Create build directory
if (!(Test-Path "build")) {
    New-Item -ItemType Directory -Name "build" | Out-Null
    Write-Host "✅ Created build directory" -ForegroundColor Green
}

Set-Location "build"

# Configure project
Write-Host ""
Write-Host "Configuring project with $generator..." -ForegroundColor Cyan
cmake -G $generator ..
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ ERROR: Failed to configure project" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# Build project
Write-Host ""
Write-Host "Building project..." -ForegroundColor Cyan
cmake --build . --config Release
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ ERROR: Failed to build project" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# Check if executable was created
if (Test-Path "bin\GhostHitSystem.exe") {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "           BUILD SUCCESSFUL!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Executable created at: build\bin\GhostHitSystem.exe" -ForegroundColor Green
    Write-Host ""
    Write-Host "To run the program:" -ForegroundColor Yellow
    Write-Host "1. Right-click on GhostHitSystem.exe" -ForegroundColor White
    Write-Host "2. Select 'Run as administrator'" -ForegroundColor White
    Write-Host "3. Use Ctrl + G to activate Ghost Hit System" -ForegroundColor White
    Write-Host ""
    
    $openFolder = Read-Host "Open build folder? (y/n)"
    if ($openFolder -eq "y" -or $openFolder -eq "Y") {
        Invoke-Item "."
    }
} else {
    Write-Host "❌ ERROR: Executable not found after build" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Set-Location ".."
Write-Host ""
Write-Host "Build completed successfully!" -ForegroundColor Green