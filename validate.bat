@echo off
REM QuitTasks - Validation Script for Windows
REM Verifies project structure and configuration

setlocal enabledelayedexpansion
set ERRORS=0

echo.
echo 🔍 Validating QuitTasks project...
echo.

echo 📦 Core Files:
if exist App.tsx (echo ✓ App.tsx) else (echo ✗ App.tsx & set /A ERRORS=!ERRORS!+1)
if exist package.json (echo ✓ package.json) else (echo ✗ package.json & set /A ERRORS=!ERRORS!+1)
if exist tsconfig.json (echo ✓ tsconfig.json) else (echo ✗ tsconfig.json & set /A ERRORS=!ERRORS!+1)
if exist babel.config.js (echo ✓ babel.config.js) else (echo ✗ babel.config.js & set /A ERRORS=!ERRORS!+1)

echo.
echo 📁 Directories:
if exist screens\ (echo ✓ screens\) else (echo ✗ screens\ & set /A ERRORS=!ERRORS!+1)
if exist components\ (echo ✓ components\) else (echo ✗ components\ & set /A ERRORS=!ERRORS!+1)
if exist services\ (echo ✓ services\) else (echo ✗ services\ & set /A ERRORS=!ERRORS!+1)
if exist store\ (echo ✓ store\) else (echo ✗ store\ & set /A ERRORS=!ERRORS!+1)
if exist types\ (echo ✓ types\) else (echo ✗ types\ & set /A ERRORS=!ERRORS!+1)

echo.
echo 🔧 Configuration:
if exist .eslintrc.json (echo ✓ .eslintrc.json) else (echo ✗ .eslintrc.json & set /A ERRORS=!ERRORS!+1)
if exist .prettierrc (echo ✓ .prettierrc) else (echo ✗ .prettierrc & set /A ERRORS=!ERRORS!+1)
if exist .gitignore (echo ✓ .gitignore) else (echo ✗ .gitignore & set /A ERRORS=!ERRORS!+1)

echo.
echo 🚀 Workflows:
if exist .github\workflows\ci.yml (echo ✓ .github\workflows\ci.yml) else (echo ✗ .github\workflows\ci.yml & set /A ERRORS=!ERRORS!+1)
if exist .github\workflows\release.yml (echo ✓ .github\workflows\release.yml) else (echo ✗ .github\workflows\release.yml & set /A ERRORS=!ERRORS!+1)

echo.
echo ================================
if !ERRORS! equ 0 (
    echo ✅ All checks passed!
) else (
    echo ❌ !ERRORS! error(s) found
)
echo ================================
echo.
