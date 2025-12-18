# Changelog

Tutti i cambiamenti notevoli a questo progetto verranno documentati in questo file.

## [0.0.1] - 2025-01-01

### Added
- Struttura base dell'app con React Native ed Expo
- Store Zustand per la gestione dello stato
- NLP Parser per il parsing dei task in input naturale
- Screens: Home, AddTask, Settings
- TaskItem component con support per checkbox e delete
- QuickInputBar component per l'aggiunta rapida di task
- TypeScript support completo
- GitHub Actions CI/CD pipeline

### Features
- Parsing naturale dei task con:
  - `@context` per categorizzare (work, home, personal)
  - `#tags` per taggare i task
  - `oggi/today` per i task di oggi
- Task bucket system (today/later)
- Toggle task completion
- Delete task functionality

### Infrastructure
- GitHub Actions workflow per CI
- ESLint + Prettier configuration
- Type checking con TypeScript
- .gitignore configuration

## [Unreleased]

### Planned
- Persistent storage con AsyncStorage
- IAP integration
- Notifications
- Search & filter
- Task statistics
- Dark mode support
