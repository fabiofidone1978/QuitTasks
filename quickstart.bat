@echo off
REM 🚀 QuitTasks - Quick Start Script (Windows)
REM Run this to get started with the project in 2 minutes!

cls

echo.
echo ╔════════════════════════════════════════════════════╗
echo ║      🚀 QuitTasks - Quick Start Guide 🚀         ║
echo ║                   v0.0.1                          ║
echo ╚════════════════════════════════════════════════════╝
echo.

REM Check if in correct directory
if not exist package.json (
    echo ❌ Error: package.json not found!
    echo Make sure you're in the QuitTasks directory
    pause
    exit /b 1
)

echo 📋 Quick Start in 3 Steps
echo.
echo Step 1️⃣ : Install Dependencies
echo ─────────────────────────────────
echo Running: npm install
echo.

call npm install
if errorlevel 1 (
    echo ⚠️  npm not found. Please install Node.js first.
    echo Download from: https://nodejs.org/
    pause
    exit /b 1
)

echo.
echo ✅ Dependencies installed!
echo.

echo Step 2️⃣ : Verify Type Safety
echo ─────────────────────────────────
echo Running: npm run lint
echo.

call npm run lint
if errorlevel 1 (
    echo ⚠️  Type checking failed. Check errors above.
    pause
    exit /b 1
)

echo.
echo ✅ Type checking passed!
echo.

echo Step 3️⃣ : Start Development
echo ─────────────────────────────────
echo.
echo Next command to run:
echo   npm start
echo.
echo This will start the Expo development server.
echo.
echo Available options:
echo   - Press 'i' for iOS simulator
echo   - Press 'a' for Android emulator
echo   - Press 'w' for web browser
echo   - Press 'q' to exit
echo.

echo ╔════════════════════════════════════════════════════╗
echo ║               ✅ Ready to go! 🎉                  ║
echo ╚════════════════════════════════════════════════════╝
echo.
echo 📚 Documentation:
echo   - README.md - Full guide
echo   - RIEPILOGO.md - In Italian
echo   - CONTRIBUTING.md - How to contribute
echo   - DEPLOYMENT.md - Deploy guide
echo.
echo 💡 Tip: Type 'npm start' to begin development!
echo.
pause
