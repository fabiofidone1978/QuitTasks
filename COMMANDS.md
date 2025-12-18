# 🎯 QUICK REFERENCE - Essential Commands

Guida rapida ai comandi più importanti.

## 🚀 Getting Started

```bash
# Setup completo (installa dipendenze + Expo)
bash setup.sh              # macOS/Linux
setup.bat                  # Windows

# Quick start (install + lint + ready)
bash quickstart.sh         # macOS/Linux
quickstart.bat             # Windows
```

## 📝 Development Commands

```bash
# Start development server
npm start

# Run on iOS simulator (macOS only)
npm run ios

# Run on Android emulator
npm run android

# Run on web browser
npm run web

# Type checking
npm run lint

# Format code with Prettier
npx prettier --write .

# Lint with ESLint
npx eslint . --fix

# Check dependencies for vulnerabilities
npm audit
```

## 🔧 Validation & Testing

```bash
# Validate project structure
bash validate.sh           # macOS/Linux
validate.bat               # Windows

# Generate project report
bash report.sh             # macOS/Linux
report.bat                 # Windows

# Check specific file types
find . -name "*.ts" -o -name "*.tsx" | grep -v node_modules
```

## 📦 Package Management

```bash
# Install all dependencies
npm install

# Install a new package
npm install package-name

# Install as dev dependency
npm install --save-dev package-name

# Update all packages
npm update

# Check for outdated packages
npm outdated

# Clean cache
npm cache clean --force
```

## 🔄 Git & Version Control

```bash
# Initialize repository
git init

# Add all files
git add .

# Commit changes
git commit -m "feat: description"

# Push to remote
git push origin main

# Create a tag (release)
git tag v0.0.1
git push origin v0.0.1

# View commit history
git log --oneline

# Check status
git status
```

## 🚀 Deployment

```bash
# Create release tag
git tag v1.0.0
git push origin v1.0.0

# GitHub Actions automatically:
# 1. Runs type checking
# 2. Creates release on GitHub
# 3. Generates release notes

# Build for iOS (Expo)
npm install -g eas-cli
eas build --platform ios

# Build for Android (Expo)
eas build --platform android

# Submit to App Store
eas submit --platform ios

# Submit to Play Store
eas submit --platform android
```

## 🔍 Debugging

```bash
# Type check with detailed output
npx tsc --noEmit --listFiles

# Check for TypeScript errors
npx tsc --noEmit

# View Expo diagnostics
expo diagnostics

# Clear Expo cache
expo logout
expo login

# Reset cache
rm -rf node_modules
npm install
expo prebuild --clean
```

## 📊 Project Info

```bash
# Show npm version
npm --version

# Show Node version
node --version

# Show npm packages installed
npm list

# Show only top-level packages
npm list --depth=0

# Show outdated packages
npm outdated

# Show package licenses
npm list --all
```

## 🔐 Security

```bash
# Audit packages for vulnerabilities
npm audit

# Fix vulnerabilities automatically
npm audit fix

# Check for high severity issues
npm audit --audit-level=high
```

## 📖 Documentation

```bash
# Open README
cat README.md

# Open in Italian
cat RIEPILOGO.md

# View contributing guide
cat CONTRIBUTING.md

# View architecture guide
cat ARCHITECTURE.md

# View deployment guide
cat DEPLOYMENT.md
```

## 💡 Useful npm Scripts (from package.json)

```bash
npm start    # Start dev server (default command)
npm run ios  # iOS simulator
npm run android  # Android emulator
npm run web  # Web browser
npm run lint # TypeScript type checking
```

## 🎯 Common Workflows

### Local Development
```bash
npm install      # Setup
npm start        # Start dev server
# Press 'a' for Android or 'i' for iOS
# Edit code and save - changes auto-reload!
```

### Commit & Push
```bash
npm run lint     # Verify types
git add .
git commit -m "feat: your message"
git push origin your-branch
# GitHub Actions CI runs automatically!
```

### Create Release
```bash
# Update version in package.json
npm run lint     # Final check
git add .
git commit -m "chore: release v1.0.0"
git tag v1.0.0
git push origin main v1.0.0
# GitHub Actions creates release automatically!
```

### Troubleshooting
```bash
# If things break:
rm -rf node_modules
npm install          # Clean install
npm run lint         # Check types
npm start            # Start fresh

# Clear all caches:
npm cache clean --force
expo logout
expo login
```

---

## 📋 Command Cheatsheet

| Command | Purpose |
|---------|---------|
| `npm start` | Start dev server |
| `npm run lint` | Type check |
| `npm install` | Install deps |
| `git add .` | Stage changes |
| `git commit` | Commit changes |
| `git push` | Push to remote |
| `git tag` | Create version |
| `npm audit` | Check security |

---

## 🔗 Useful Links

- [Expo Docs](https://docs.expo.dev/)
- [React Native Docs](https://reactnative.dev/)
- [TypeScript Docs](https://www.typescriptlang.org/)
- [GitHub CLI](https://cli.github.com/)

---

## ✨ Pro Tips

1. **Auto-reload**: Changes save automatically during `npm start`
2. **Type checking**: Run `npm run lint` before every commit
3. **Formatting**: ESLint + Prettier configured - use them!
4. **Debugging**: Use `console.log` and React Native debugger
5. **Performance**: Use `React.memo` for expensive components
6. **Zustand**: Use selective subscriptions to avoid unnecessary re-renders

---

**Last Updated**: December 18, 2025
