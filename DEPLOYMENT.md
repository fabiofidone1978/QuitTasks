# 🚀 QuitTasks - Go-Live Checklist

Checklist completa per il deploy in produzione su GitHub e app stores.

## ✅ Pre-Launch Requirements

### Code Quality
- [ ] Tutti i file TypeScript compilano (`npm run lint` pass)
- [ ] Nessun `any` type non documentato
- [ ] Nessun `console.log` in produzione
- [ ] Code formattato con Prettier
- [ ] ESLint warnings risolti
- [ ] No unused imports

### Testing
- [ ] App avvia senza errori
- [ ] Tutte le screen funzionano
- [ ] NLP parser funziona
- [ ] Task add/edit/delete funziona
- [ ] Navigation funziona
- [ ] Testato su iOS simulator
- [ ] Testato su Android emulator
- [ ] Testato su web (se applicabile)

### Configuration
- [ ] `package.json` version corretta
- [ ] `app.json` configurato
- [ ] `app.json` name e slug corretti
- [ ] Environment variables setup
- [ ] Secrets configurati in GitHub

### Documentation
- [ ] README.md completato
- [ ] CONTRIBUTING.md presente
- [ ] CHANGELOG.md aggiornato
- [ ] ARCHITECTURE.md presente
- [ ] CODE_REVIEW.md presente
- [ ] Inline comments added dove necessario
- [ ] JSDoc per funzioni pubbliche

### Security
- [ ] No hardcoded credentials
- [ ] No API keys in code
- [ ] `.env` in `.gitignore`
- [ ] npm audit clean
- [ ] Dependencies aggiornate

### Git & GitHub
- [ ] Repository public
- [ ] README visible
- [ ] Topics aggiunti
- [ ] License (MIT) aggiunto
- [ ] `.gitignore` completo
- [ ] Branch protection setup (optional)

### GitHub Actions
- [ ] CI workflow funziona
- [ ] Release workflow setup
- [ ] Secrets configurati (se needed)
- [ ] Badges nel README (optional)

---

## 📋 GitHub Repository Setup

### Basic Info
```
Repository: QuitTasks
Owner: fabiofidone1978
Branch: main
License: MIT
Topics: react-native, expo, typescript, task-manager, nlp
```

### Description
```
Task Manager con NLP - Gestione task intelligente 
con parsing del linguaggio naturale. 
Built with React Native, Expo, TypeScript.
```

### README Badges (Optional)
```markdown
[![CI Pipeline](https://github.com/fabiofidone1978/QuitTasks/actions/workflows/ci.yml/badge.svg)](https://github.com/fabiofidone1978/QuitTasks/actions/workflows/ci.yml)
[![Release](https://github.com/fabiofidone1978/QuitTasks/actions/workflows/release.yml/badge.svg)](https://github.com/fabiofidone1978/QuitTasks/actions/workflows/release.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
```

---

## 🔑 Secrets Setup (se needed)

### GitHub Secrets
Se usi CD per app stores, aggiungi:

```
EXPO_TOKEN              # Expo API token (se usato)
APPLE_ID                # Apple ID (per iOS)
APPLE_PASSWORD          # Apple password (per iOS)
ANDROID_KEYSTORE        # Android keystore (per Android)
```

Come aggiungerli:
1. Vai a: Settings → Secrets and variables → Actions
2. New repository secret
3. Add `NAME` e `VALUE`
4. Usa in workflow: `${{ secrets.NAME }}`

---

## 📦 Release Process

### Create Release Tag
```bash
# 1. Update version in package.json
# 2. Update CHANGELOG.md
# 3. Commit
git add package.json CHANGELOG.md
git commit -m "chore: release v0.0.1"

# 4. Tag
git tag v0.0.1

# 5. Push
git push origin main
git push origin v0.0.1
```

### GitHub Actions Automatic
1. Tag push → Release workflow starts
2. Type check runs
3. Release created on GitHub
4. Release notes generated

---

## 📱 App Store Deployment

### iOS (TestFlight → App Store)

**Next Steps:**
1. Configurare build iOS
2. Creare Apple Developer account
3. Setup provisioning profiles
4. Configure EAS Build (Expo)
5. Submit to TestFlight
6. Review and release

**Commands:**
```bash
npm install -g eas-cli
eas build --platform ios
eas submit --platform ios
```

### Android (Play Store)

**Next Steps:**
1. Configurare build Android
2. Creare Google Play account
3. Setup keystore
4. Configure EAS Build (Expo)
5. Submit to Play Store
6. Review and release

**Commands:**
```bash
npm install -g eas-cli
eas build --platform android
eas submit --platform android
```

---

## 🔍 Pre-Launch Testing

### Functionality Tests
- [ ] Create task from natural language
  - `"Comprare latte @home #shopping"`
  - Expected: Title="Comprare latte", context="home", tags=["shopping"]
  
- [ ] Task bucket parsing
  - Input with "oggi" → bucket="today"
  - Input with "dopo" or no time → bucket="later"
  
- [ ] Task management
  - Add task ✓
  - Check/uncheck task ✓
  - Delete task ✓
  - List view ✓

### UI/UX Tests
- [ ] Layout responsive su tutti i device
- [ ] Touch areas adeguate (min 44x44pt)
- [ ] Colori leggibili
- [ ] Loading states mostrati
- [ ] Error messages chiari

### Performance Tests
- [ ] App starts < 3 seconds
- [ ] List smooth (60fps)
- [ ] No memory leaks
- [ ] Battery impact minimal

### Accessibility Tests
- [ ] Screen readers funzionano
- [ ] Text sizes leggibili
- [ ] Color contrast OK
- [ ] Touch targets big enough

---

## 📊 Monitoring & Analytics

### Recommended Setup
```typescript
// Add error tracking
npm install sentry-react-native

// Add analytics (optional)
npm install expo-analytics

// Add crash reporting
npm install @sentry/react-native
```

### Implementation
```typescript
import * as Sentry from "@sentry/react-native";

Sentry.init({
  dsn: "YOUR_SENTRY_DSN",
  environment: "production",
});
```

---

## 🚀 Launch Day

### Morning
- [ ] Final code review
- [ ] All tests passing
- [ ] CI/CD green
- [ ] No console errors
- [ ] Backup & version control updated

### Deploy
- [ ] Create release tag
- [ ] Push to repository
- [ ] Watch GitHub Actions
- [ ] Confirm build success

### Post-Launch
- [ ] Monitor for errors
- [ ] Check app store presence
- [ ] Verify download availability
- [ ] Share announcement
- [ ] Gather user feedback

---

## 📈 Post-Launch Tasks

### Week 1
- [ ] Monitor crash reports
- [ ] Fix critical bugs
- [ ] Gather user feedback
- [ ] Plan v0.0.2

### Month 1
- [ ] Analytics review
- [ ] Performance optimization
- [ ] Feature requests prioritization
- [ ] Plan roadmap

### Ongoing
- [ ] Keep dependencies updated
- [ ] Security patches applied
- [ ] Regular releases
- [ ] Community engagement

---

## 🔧 Troubleshooting

### Build Issues
```bash
# Clear cache
rm -rf node_modules
npm install

# Reset expo
expo logout
expo login

# Clean build
expo prebuild --clean
```

### Type Issues
```bash
# Check for errors
npm run lint

# Detailed error
npx tsc --noEmit --listFiles
```

### CI/CD Issues
1. Check workflow logs: Actions tab
2. See failed step details
3. Review error messages
4. Check secrets/environment

---

## 📞 Support Resources

- GitHub Issues: Bug reports & features
- Discussions: Q&A & ideas
- Readme: Getting started
- CONTRIBUTING.md: How to contribute
- Architecture.md: Code patterns

---

## ✨ Final Checklist (Before Merge to Main)

```
Code Review Phase:
- [ ] Code reviewed by peer (if possible)
- [ ] All comments addressed
- [ ] Tests updated

CI/CD Phase:
- [ ] CI pipeline green
- [ ] No type errors
- [ ] No lint warnings
- [ ] Security audit OK

Documentation Phase:
- [ ] README updated
- [ ] CHANGELOG updated
- [ ] Inline docs added
- [ ] API documented

Final Sign-Off:
- [ ] Ready to ship
- [ ] Can be reverted if needed
- [ ] Monitoring in place
- [ ] Support resources ready
```

---

## 🎉 Congratulations!

Se tutti i box sono checkati, sei pronto per il launch! 🚀

Buona fortuna con QuitTasks!

---

**Last Updated**: December 18, 2025  
**Status**: Ready for Launch ✅
