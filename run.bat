@echo off
echo ========================================
echo    GHOST HIT SYSTEM - RUN SCRIPT
echo ========================================
echo.

:: Check if executable exists
if exist "build\bin\GhostHitSystem.exe" (
    echo ✅ Found GhostHitSystem.exe
    echo.
    echo 🚀 Starting Ghost Hit System...
    echo ⚠️  IMPORTANT: Run as Administrator for best results!
    echo.
    echo Press any key to continue...
    pause >nul
    
    :: Try to run as administrator
    powershell -Command "Start-Process 'build\bin\GhostHitSystem.exe' -Verb RunAs"
    
) else if exist "GhostHitSystem.exe" (
    echo ✅ Found GhostHitSystem.exe in current directory
    echo.
    echo 🚀 Starting Ghost Hit System...
    echo ⚠️  IMPORTANT: Run as Administrator for best results!
    echo.
    echo Press any key to continue...
    pause >nul
    
    :: Try to run as administrator
    powershell -Command "Start-Process 'GhostHitSystem.exe' -Verb RunAs"
    
) else (
    echo ❌ GhostHitSystem.exe not found!
    echo.
    echo Please build the project first using:
    echo   1. build.bat (Windows Batch)
    echo   2. build.ps1 (PowerShell)
    echo   3. Or open GhostHitSystem.sln in Visual Studio
    echo.
    pause
)