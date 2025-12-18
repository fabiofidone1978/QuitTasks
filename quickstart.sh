#!/usr/bin/env bash

# 🚀 QuitTasks - Quick Start Script
# Run this to get started with the project in 2 minutes!

set -e

clear

echo "╔════════════════════════════════════════════════════╗"
echo "║      🚀 QuitTasks - Quick Start Guide 🚀         ║"
echo "║                   v0.0.1                          ║"
echo "╚════════════════════════════════════════════════════╝"
echo ""

# Check if in correct directory
if [ ! -f "package.json" ]; then
    echo "❌ Error: package.json not found!"
    echo "Make sure you're in the QuitTasks directory"
    exit 1
fi

echo "📋 Quick Start in 3 Steps"
echo ""
echo "Step 1️⃣ : Install Dependencies"
echo "─────────────────────────────────"
echo "Running: npm install"
echo ""

if command -v npm &> /dev/null; then
    npm install
    echo ""
    echo "✅ Dependencies installed!"
else
    echo "⚠️  npm not found. Please install Node.js first."
    echo "Download from: https://nodejs.org/"
    exit 1
fi

echo ""
echo "Step 2️⃣ : Verify Type Safety"
echo "─────────────────────────────────"
echo "Running: npm run lint"
echo ""

npm run lint
echo ""
echo "✅ Type checking passed!"

echo ""
echo "Step 3️⃣ : Start Development"
echo "─────────────────────────────────"
echo ""
echo "Next command to run:"
echo "  npm start"
echo ""
echo "This will start the Expo development server."
echo ""
echo "Available options:"
echo "  - Press 'i' for iOS simulator"
echo "  - Press 'a' for Android emulator"
echo "  - Press 'w' for web browser"
echo "  - Press 'e' to exit"
echo ""

echo "╔════════════════════════════════════════════════════╗"
echo "║               ✅ Ready to go! 🎉                  ║"
echo "╚════════════════════════════════════════════════════╝"
echo ""
echo "📚 Documentation:"
echo "  - README.md - Full guide"
echo "  - RIEPILOGO.md - In Italian"
echo "  - CONTRIBUTING.md - How to contribute"
echo "  - DEPLOYMENT.md - Deploy guide"
echo ""
echo "💡 Tip: Type 'npm start' to begin development!"
echo ""
