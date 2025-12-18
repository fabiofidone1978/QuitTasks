# QuitTasks - Task Manager con NLP

Un'app mobile basata su React Native per gestire task con parsing del linguaggio naturale. Supporta il parsing automatico di contesti (@work, @home, @personal), tag (#tag) e tempo (oggi/later).

## ✨ Features

- **Parsing NLP**: Scrivi i task in linguaggio naturale
  - `@context` - Categorizza per contesto
  - `#tags` - Aggiungi tag ai task
  - `oggi/today` - Task per oggi vs dopo
- **Task Management**: Aggiungi, completa, elimina task
- **Categorizzazione**: Task bucket system (Today/Later)
- **Moderno**: Stack React Native + TypeScript + Zustand

## 🚀 Quick Start

### Prerequisiti
- Node.js 18+
- npm o yarn
- Expo CLI: `npm install -g expo-cli`

### Installazione

```bash
# Clone il repository
git clone https://github.com/fabiofidone1978/QuitTasks.git
cd QuitTasks

# Install dependencies
npm install

# Start
npm start

# iOS (richiede Xcode su Mac)
npm run ios

# Android (richiede Android Studio)
npm run android

# Web
npm run web
```

## 📁 Struttura del Progetto

```
QuitTasks/
├── App.tsx                 # Entry point
├── screens/
│   ├── HomeScreen.tsx      # Task list view
│   ├── AddTaskScreen.tsx   # Add new task
│   └── SettingsScreen.tsx  # Settings
├── components/
│   ├── TaskItem.tsx        # Task list item
│   └── QuickInputBar.tsx   # Quick input
├── services/
│   ├── nlpService.ts       # NLP parsing
│   └── iapService.ts       # In-app purchases
├── store/
│   └── taskStore.ts        # Zustand store
├── types/
│   ├── tasks.ts            # Task types
│   └── navigation.ts       # Navigation types
└── .github/
    └── workflows/          # GitHub Actions CI/CD
```

## 🛠️ Development

### Scripts

```bash
# Type checking
npm run lint

# Start dev server
npm start

# Format code
npx prettier --write .

# Run linter
npx eslint . --fix
```

### Type Safety

Il progetto usa TypeScript con strict mode:
- `tsconfig.json` - Configurazione TypeScript
- `npm run lint` - Type checking

## 🔄 CI/CD Pipeline

### GitHub Actions Workflows

1. **CI Pipeline** (`.github/workflows/ci.yml`)
   - Lint & Type Check
   - Build & Test
   - Security Audit

2. **Release** (`.github/workflows/release.yml`)
   - Automatico su tag `v*`
   - Crea release su GitHub

### Triggering

- Push su `main` o `develop` → CI Pipeline
- Tag push (v*) → Release

## 📝 Commit Messages

Usiamo Conventional Commits:

```
feat: aggiungere una nuova feature
fix: correggere un bug
docs: aggiornare documentazione
style: refactoring senza logic changes
chore: build, dependencies
```

## 🤝 Contribuire

Vedi [CONTRIBUTING.md](CONTRIBUTING.md) per le linee guida.

### Processo

1. Crea branch da `develop`
2. Committa con messaggi descriptivi
3. Pusha e apri PR verso `develop`
4. Attendi review e CI pass

## 📦 Dependencies

### Core
- `react@18.2.0` - UI library
- `react-native@0.74.0` - Mobile framework
- `expo@~51.0.0` - Build system

### State Management
- `zustand@4.5.2` - Lightweight state

### UI Components
- `react-native-paper@5.12.5` - Material Design

### Navigation
- `@react-navigation/native` - Routing
- `@react-navigation/native-stack` - Stack navigation

### Dev
- `typescript@5.4.5` - Type safety
- `@babel/core` - Transpiling

## 📄 License

MIT

## 👤 Author

Fabio Fidone (@fabiofidone1978)

---

Made with ❤️ for better task management
