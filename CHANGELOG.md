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

### Fixed
- Fixed TypeScript configuration issue preventing compilation
  - Updated react-native-gesture-handler to valid version (~2.16.0)
  - Removed jest types from tsconfig.json (project has no test infrastructure)
  - Resolved all 74 TypeScript compilation errors

### Planned
- Persistent storage con AsyncStorage
- IAP integration
- Notifications
- Search & filter
- Task statistics
- Dark mode support
