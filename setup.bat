@echo off
REM QuitTasks - Setup Script for Windows

echo.
echo 🚀 Setting up QuitTasks...
echo.

REM Check Node.js
where node >nul 2>nul
if errorlevel 1 (
    echo ❌ Node.js is not installed. Please install Node.js 18+
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
echo ✓ Node.js: %NODE_VERSION%

REM Install dependencies
echo.
echo 📦 Installing dependencies...
call npm install

REM Install Expo CLI if not present
where expo >nul 2>nul
if errorlevel 1 (
    echo.
    echo 📱 Installing Expo CLI...
    call npm install -g expo-cli
)

REM Run type check
echo.
echo 🔍 Running type check...
call npm run lint

echo.
echo ✅ Setup complete!
echo.
echo Available commands:
echo   npm start      - Start dev server
echo   npm run ios    - Run on iOS
echo   npm run android - Run on Android
echo   npm run web    - Run on web
echo   npm run lint   - Type check
echo.
echo Get started with: npm start
echo.
pause
