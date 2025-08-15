@echo off
echo ========================================
echo    GHOST HIT SYSTEM - BUILD SCRIPT
echo ========================================
echo.

:: Check if CMake is installed
cmake --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: CMake is not installed or not in PATH
    echo Please install CMake from: https://cmake.org/download/
    pause
    exit /b 1
)

:: Check if Visual Studio is available
where cl >nul 2>&1
if %errorlevel% equ 0 (
    echo Using Visual Studio compiler...
    set GENERATOR="Visual Studio 17 2022"
) else (
    echo Using MinGW compiler...
    set GENERATOR="MinGW Makefiles"
)

:: Create build directory
if not exist "build" mkdir build
cd build

:: Configure project
echo.
echo Configuring project with %GENERATOR%...
cmake -G %GENERATOR% ..
if %errorlevel% neq 0 (
    echo ERROR: Failed to configure project
    pause
    exit /b 1
)

:: Build project
echo.
echo Building project...
cmake --build . --config Release
if %errorlevel% neq 0 (
    echo ERROR: Failed to build project
    pause
    exit /b 1
)

:: Check if executable was created
if exist "bin\GhostHitSystem.exe" (
    echo.
    echo ========================================
    echo    BUILD SUCCESSFUL!
    echo ========================================
    echo.
    echo Executable created at: build\bin\GhostHitSystem.exe
    echo.
    echo To run the program:
    echo 1. Right-click on GhostHitSystem.exe
    echo 2. Select "Run as administrator"
    echo 3. Use Ctrl + G to activate Ghost Hit System
    echo.
    echo Press any key to open the build folder...
    pause >nul
    explorer .
) else (
    echo ERROR: Executable not found after build
    pause
    exit /b 1
)

cd ..