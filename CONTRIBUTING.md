# Contributing to QuitTasks

Grazie per il tuo interesse nel contribuire a QuitTasks!

## Linee guida

### Branches
- `main` - Produzione stabile
- `develop` - Sviluppo attivo

### Processo di contribuzione
1. Fork il repository
2. Crea un branch dal `develop`: `git checkout -b feature/tua-feature`
3. Committa i tuoi cambiamenti: `git commit -am 'Add: descrizione'`
4. Pusha verso il branch: `git push origin feature/tua-feature`
5. Apri una Pull Request verso `develop`

### Commit messages
- `feat:` - Nuova feature
- `fix:` - Bug fix
- `docs:` - Documentazione
- `style:` - Formattazione, refactoring (no logic changes)
- `chore:` - Build, dependencies, version bumps

### Code Style
- Usiamo TypeScript per type safety
- ESLint + Prettier per la formattazione
- Niente `any` types quando possibile

### Before submitting
1. Esegui `npm run lint` per verificare i tipi
2. Assicurati che il codice sia formattato con Prettier
3. Scrivi commit messages descriptivi
4. Testa le modifiche localmente

### Testing
I PR passano attraverso GitHub Actions che verificano:
- Type checking
- Linting
- Structure validation
