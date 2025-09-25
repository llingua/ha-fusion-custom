# Changelog

## [2024.10.0-custom] - 2024-09-24

### Aggiunto

- 🎯 **Componente Bar Universale**: Bar di progresso utilizzabile sia nella sidebar che nel dashboard principale
- ⚙️ **Configurazione flessibile**: Tre dimensioni (Compatta, Media, Grande)
- 🎨 **Interfaccia migliorata**: Click diretto per modificare le bar nel main dashboard
- 💾 **Salvataggio ottimizzato**: Sistema di salvataggio manuale migliorato
- 🔄 **Reattività garantita**: Key block per aggiornamenti immediati delle modifiche

### Modificato

- 📂 **Struttura componenti**: Creata directory `Universal/` per componenti riutilizzabili
- 🎛️ **Modal di configurazione**: Migliorata la gestione degli input e degli eventi
- 📝 **Tipizzazione**: Aggiornate le interfacce TypeScript per il nuovo componente

### Corretto

- 🐛 **Input name**: Risolti conflitti di binding negli input di testo
- 🎨 **CSS styling**: Applicati colori funzionanti per la visualizzazione delle barre
- 💾 **Sistema di salvataggio**: Rimosso auto-save problematico

### Tecnico

- 🛠️ **File modificati**:
  - `src/lib/Universal/Bar.svelte` (nuovo)
  - `src/lib/Main/Content.svelte`
  - `src/lib/Modal/BarConfig.svelte`
  - `src/lib/Modal/MainItemConfig.svelte`
  - `src/lib/Types.ts`
  - `src/lib/Sidebar/Index.svelte`
