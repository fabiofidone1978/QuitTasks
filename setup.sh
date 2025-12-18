#!/bin/bash

# QuitTasks - Setup Script
# This script sets up the project for development

set -e

echo "🚀 Setting up QuitTasks..."

# Check Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 18+"
    exit 1
fi

echo "✓ Node.js: $(node --version)"

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Install Expo CLI if not present
if ! command -v expo &> /dev/null; then
    echo "📱 Installing Expo CLI..."
    npm install -g expo-cli
fi

echo "✓ Expo CLI: $(expo --version)"

# Run type check
echo "🔍 Running type check..."
npm run lint

echo ""
echo "✅ Setup complete!"
echo ""
echo "Available commands:"
echo "  npm start      - Start dev server"
echo "  npm run ios    - Run on iOS"
echo "  npm run android - Run on Android"
echo "  npm run web    - Run on web"
echo "  npm run lint   - Type check"
echo ""
echo "Get started with: npm start"
