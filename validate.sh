#!/bin/bash

# QuitTasks - Validation Script
# Verifies project structure and configuration

set -e

echo "🔍 Validating QuitTasks project..."
echo ""

ERRORS=0
WARNINGS=0

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

check_file() {
    if [ -f "$1" ]; then
        echo -e "${GREEN}✓${NC} $1"
    else
        echo -e "${RED}✗${NC} $1"
        ((ERRORS++))
    fi
}

check_dir() {
    if [ -d "$1" ]; then
        echo -e "${GREEN}✓${NC} $1/"
    else
        echo -e "${RED}✗${NC} $1/"
        ((ERRORS++))
    fi
}

echo "📦 Core Files:"
check_file "App.tsx"
check_file "package.json"
check_file "tsconfig.json"
check_file "babel.config.js"

echo ""
echo "📁 Directories:"
check_dir "screens"
check_dir "components"
check_dir "services"
check_dir "store"
check_dir "types"

echo ""
echo "🔧 Configuration:"
check_file ".eslintrc.json"
check_file ".prettierrc"
check_file ".gitignore"
check_file "CONTRIBUTING.md"
check_file "CHANGELOG.md"

echo ""
echo "🚀 Workflows:"
check_file ".github/workflows/ci.yml"
check_file ".github/workflows/release.yml"

echo ""
echo "📄 Screen Files:"
check_file "screens/HomeScreen.tsx"
check_file "screens/AddTaskScreen.tsx"
check_file "screens/SettingsScreen.tsx"

echo ""
echo "🧩 Components:"
check_file "components/TaskItem.tsx"
check_file "components/QuickInputBar.tsx"

echo ""
echo "⚙️ Services:"
check_file "services/nlpService.ts"
check_file "services/iapService.ts"

echo ""
echo "📚 Store & Types:"
check_file "store/taskStore.ts"
check_file "types/tasks.ts"
check_file "types/navigation.ts"

echo ""
echo "================================"
if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}✅ All checks passed!${NC}"
else
    echo -e "${RED}❌ $ERRORS error(s) found${NC}"
fi

if [ $WARNINGS -gt 0 ]; then
    echo -e "${YELLOW}⚠️  $WARNINGS warning(s)${NC}"
fi

echo "================================"

exit $ERRORS
