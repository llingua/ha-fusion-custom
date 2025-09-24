# 📚 Documentazione ha-fusion - Struttura e Componenti

_Documentazione completa in italiano per sviluppatori_

---

## 📖 Panoramica

**ha-fusion** è una dashboard moderna per Home Assistant costruita con **Svelte/SvelteKit** e **TypeScript**. Questa documentazione descrive la struttura delle cartelle e i componenti principali del progetto.

---

## 🗂️ Struttura Generale del Progetto

```
ha-fusion/
├── 📁 src/                    # Codice sorgente principale
├── 📁 static/                 # File statici (immagini, temi, traduzioni)
├── 📁 data/                   # Dati di configurazione
├── 📁 scripts/                # Script di utilità
├── 📄 package.json            # Dipendenze e script npm
├── 📄 svelte.config.js        # Configurazione Svelte
├── 📄 vite.config.ts          # Configurazione Vite
├── 📄 tsconfig.json           # Configurazione TypeScript
├── 📄 .env                    # Variabili d'ambiente
└── 📄 docker-compose.yml      # Configurazione Docker
```

---

## 🎯 Cartella `/src` - Codice Sorgente

### 📂 `/src/lib/` - Libreria Componenti

#### 🧩 `/src/lib/Components/` - Componenti Riutilizzabili

_Componenti UI generici utilizzati in tutta l'applicazione_

| Componente            | Descrizione                                   |
| --------------------- | --------------------------------------------- |
| `CodeEditor.svelte`   | Editor di codice con syntax highlighting      |
| `ColorPicker.svelte`  | Selettore colori per temi e personalizzazioni |
| `ComputeIcon.svelte`  | Calcolo dinamico delle icone basato su entità |
| `CustomJs.svelte`     | Editor per JavaScript personalizzato          |
| `InputClear.svelte`   | Input con pulsante di cancellazione           |
| `LightSlider.svelte`  | Slider specifico per controllo luci           |
| `Loader.svelte`       | Indicatore di caricamento                     |
| `Marquee.svelte`      | Testo scorrevole per contenuti lunghi         |
| `Progress.svelte`     | Barra di progresso                            |
| `RangeSlider.svelte`  | Slider per valori numerici                    |
| `ResizeHandle.svelte` | Maniglia per ridimensionamento                |
| `Select.svelte`       | Menu a tendina personalizzato                 |
| `StateLogic.svelte`   | Logica per gestione stati entità              |
| `Theme.svelte`        | Applicatore temi                              |
| `Toggle.svelte`       | Interruttore on/off                           |
| `TokenModal.svelte`   | Modal per gestione token di accesso           |
| `WheelPicker.svelte`  | Selettore a rotella                           |

#### 📋 `/src/lib/Drawer/` - Menu Laterale

_Componenti del menu di navigazione e configurazione_

| Componente                | Descrizione                         |
| ------------------------- | ----------------------------------- |
| `Index.svelte`            | Componente principale del drawer    |
| `AddDropdown.svelte`      | Menu per aggiungere nuovi elementi  |
| `AppearanceButton.svelte` | Pulsante per configurazione aspetto |
| `CodeButton.svelte`       | Pulsante per modalità codice        |
| `EditModeButton.svelte`   | Attivazione modalità modifica       |
| `HistoryButtons.svelte`   | Pulsanti undo/redo                  |
| `MenuButton.svelte`       | Pulsante menu principale            |
| `SaveButton.svelte`       | Salvataggio configurazione          |
| `SearchInput.svelte`      | Campo di ricerca entità             |
| `SettingsButton.svelte`   | Accesso alle impostazioni           |
| `ViewButton.svelte`       | Gestione viste multiple             |

#### 🏠 `/src/lib/Main/` - Componenti Dashboard Principale

_Componenti centrali della dashboard_

| Componente                | Descrizione                             |
| ------------------------- | --------------------------------------- |
| `Index.svelte`            | Layout principale della dashboard       |
| `Button.svelte`           | Pulsanti di controllo entità            |
| `Camera.svelte`           | Visualizzazione telecamere              |
| `Camera/`                 | Sub-componenti specifici per telecamere |
| `ConditionalMedia.svelte` | Media condizionali                      |
| `Configure.svelte`        | Interfaccia di configurazione           |
| `Content.svelte`          | Area contenuto principale               |
| `PictureElements.svelte`  | Elementi immagine interattivi           |
| `Scenes.svelte`           | Gestione scene Home Assistant           |
| `Views.svelte`            | Gestione viste multiple                 |

#### 🔧 `/src/lib/Modal/` - Finestre Modali

_Modal di configurazione per ogni tipo di entità_

**Modal per Entità Home Assistant:**

- `LightModal.svelte` - Configurazione luci
- `SwitchModal.svelte` - Configurazione interruttori
- `SensorModal.svelte` - Configurazione sensori
- `ClimateModal.svelte` - Configurazione climatizzatori
- `CameraModal.svelte` - Configurazione telecamere
- `MediaPlayer.svelte` - Configurazione media player
- `CoverModal.svelte` - Configurazione tapparelle/coperture
- `FanModal.svelte` - Configurazione ventole
- `LockModal.svelte` - Configurazione serrature
- `VacuumModal.svelte` - Configurazione aspirapolvere
- `AlarmControlPanelModal.svelte` - Configurazione allarmi

**Modal di Configurazione:**

- `AppearanceConfig.svelte` - Configurazione aspetto
- `ButtonConfig.svelte` - Configurazione pulsanti
- `SensorConfig.svelte` - Configurazione sensori
- `WeatherConfig.svelte` - Configurazione meteo
- `CalendarModal.svelte` - Configurazione calendario
- `ThemeEditor.svelte` - Editor temi personalizzati

**Modal Specializzate:**

- `PictureElements/` - Sottocartella per elementi immagine
- `VisibilityConfig/` - Configurazioni visibilità
- `ConfirmAlert.svelte` - Dialog di conferma
- `Templater.svelte` - Editor template Jinja2

#### ⚙️ `/src/lib/Settings/` - Pannelli Impostazioni

_Configurazioni globali dell'applicazione_

| Componente        | Descrizione                      |
| ----------------- | -------------------------------- |
| `Index.svelte`    | Pannello principale impostazioni |
| `Addons.svelte`   | Gestione addon                   |
| `CustomJs.svelte` | JavaScript personalizzato        |
| `Language.svelte` | Selezione lingua                 |
| `Logout.svelte`   | Logout da Home Assistant         |
| `Motion.svelte`   | Impostazioni animazioni          |
| `Token.svelte`    | Gestione token di accesso        |
| `Version.svelte`  | Informazioni versione            |

#### 📱 `/src/lib/Sidebar/` - Barra Laterale

_Navigazione rapida e controlli_

21 componenti per la gestione della sidebar, inclusa la navigazione tra stanze, controlli rapidi, e visualizzazione stato sistema.

### 📡 `/src/lib/` - File di Utilità

| File             | Descrizione                                       |
| ---------------- | ------------------------------------------------- |
| `Socket.ts`      | Gestione connessione WebSocket con Home Assistant |
| `Stores.ts`      | Store Svelte per stato globale                    |
| `Types.ts`       | Definizioni TypeScript                            |
| `Utils.ts`       | Funzioni di utilità generiche                     |
| `Weather.ts`     | Logica per componenti meteo                       |
| `Conditional.ts` | Logica per rendering condizionale                 |

### 🛣️ `/src/routes/` - Route SvelteKit

#### Pagine Principali:

- `+page.svelte` - Pagina principale dashboard
- `+layout.svelte` - Layout base dell'applicazione
- `+page.server.ts` - Logica server-side

#### API Routes (`/src/routes/_api/`):

- `save_config/` - Salvataggio configurazione
- `save_dashboard/` - Salvataggio dashboard
- `get_calendar/` - Dati calendario
- `load_theme/` - Caricamento temi
- `custom_js/` - JavaScript personalizzato
- `youtube/` - Integrazione YouTube
- `version/` - Informazioni versione

---

## 📁 Cartella `/static` - File Statici

### 🎨 `/static/themes/` - Temi

Temi predefiniti in formato YAML:

- `contrast.yaml` - Tema ad alto contrasto
- `godis.yaml` - Tema Godis
- `muted.yaml` - Tema muted
- `playground/` - Temi sperimentali

### 🌍 `/static/translations/` - Traduzioni

File JSON per 50+ lingue supportate, incluso:

- `it.json` - Traduzione italiana
- `en.json` - Inglese (predefinito)
- Altri file per traduzioni internazionali

### 🌤️ `/static/weather/` - Icone Meteo

- `meteocons/` - Set completo di icone meteo SVG
- Icone per ogni condizione meteo (giorno/notte)

### 📖 `/static/documentation/` - Documentazione

- `Developer.md` - Guida sviluppatori
- `Documentation.md` - Documentazione utente
- `Map.md` - Documentazione mappe

---

## 🔧 File di Configurazione Principali

### `package.json`

- **Framework**: Svelte 4.2.19, SvelteKit 2.6.4
- **Build Tool**: Vite 5.4.8
- **Linguaggio**: TypeScript 5.6.3
- **Dipendenze Principali**:
  - Home Assistant WebSocket
  - D3.js per grafici
  - CodeMirror per editor
  - Express.js per server

### `svelte.config.js`

- Configurazione Svelte
- Adapter Node.js per produzione
- Preprocessor TypeScript

### `vite.config.ts`

- Server di sviluppo Vite
- Hot Module Replacement
- Proxy per API

### `.env`

```bash
HASS_URL=https://your-homeassistant-domain.com
```

---

## 🚀 Flusso di Sviluppo

### 1. **Avvio Sviluppo**

```bash
npm run dev
# Server su http://localhost:5173/
```

### 2. **Struttura Componenti**

- **Componenti atomici** in `/Components/`
- **Logica business** in `/lib/*.ts`
- **Layout specifici** in `/Main/`, `/Drawer/`, `/Sidebar/`
- **Configurazioni** in `/Modal/` e `/Settings/`

### 3. **Aggiunta Nuove Funzionalità**

1. Creare componente in cartella appropriata
2. Aggiungere tipi in `Types.ts`
3. Integrare negli store in `Stores.ts`
4. Aggiungere traduzione in `/static/translations/`

### 4. **Build Produzione**

```bash
npm run build
# Output in cartella build/
```

---

## 📱 Architettura Responsive

- **Mobile First**: Design responsive nativo
- **Touch Friendly**: Controlli ottimizzati per touch
- **Progressive Web App**: Supporto PWA completo
- **Dark/Light Mode**: Temi automatici

---

## 🔌 Integrazione Home Assistant

### WebSocket Connection

- Connessione real-time tramite `Socket.ts`
- Auto-reconnect in caso di disconnessione
- Gestione stati entità in tempo reale

### Entità Supportate

- ✅ Luci (dimmer, colori, temperature)
- ✅ Interruttori
- ✅ Sensori (temperatura, umidità, etc.)
- ✅ Telecamere (live stream, snapshot)
- ✅ Media Player (controlli, artwork)
- ✅ Climatizzatori
- ✅ Tapparelle/Coperture
- ✅ Scene e Automazioni
- ✅ E molto altro...

---

## 🎯 Best Practices per Sviluppatori

### Convenzioni Codice

- **Componenti**: PascalCase (es. `ButtonConfig.svelte`)
- **File utilità**: camelCase (es. `utils.ts`)
- **Store**: Reactive statements con `$:`
- **Props**: Interface TypeScript definite

### Performance

- **Lazy Loading**: Componenti caricati on-demand
- **Virtual Scrolling**: Per liste lunghe
- **Image Optimization**: WebP dove supportato
- **Bundle Splitting**: Codice diviso per route

### Accessibilità

- **ARIA Labels**: Su tutti i controlli
- **Keyboard Navigation**: Supporto completo tastiera
- **Screen Reader**: Supporto lettori schermo
- **Color Contrast**: Conformità WCAG

---

_Documentazione aggiornata per ha-fusion v2024.10.0_
_Per domande o contributi, consultare il repository GitHub ufficiale_
