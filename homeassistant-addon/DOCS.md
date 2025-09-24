# HA Fusion Custom Add-on

## Informazioni

Questo add-on installa una versione personalizzata di HA Fusion con il componente **Bar universale** che può essere utilizzato sia nella sidebar che nel dashboard principale.

## Novità

### 🎯 Componente Bar Universale

- **Disponibile nel main dashboard**: Ora puoi aggiungere barre di progresso anche nel dashboard principale
- **Configurabile**: Tre dimensioni (Compatta, Media, Grande)
- **Riutilizzabile**: Lo stesso componente funziona sia nella sidebar che nel main
- **Modificabile**: Click per modificare direttamente dal dashboard

### ⚙️ Come Usare

1. **Installazione**: Installa questo add-on
2. **Avvio**: Avvia l'add-on
3. **Accesso**: Clicca su "OPEN WEB UI" oppure vai su `http://homeassistant:5050`
4. **Configurazione**: Collega alla tua istanza Home Assistant
5. **Modifica**: Entra in modalità edit (icona matita)
6. **Aggiungi Bar**: Click su "+" → Scegli "Bar" → Configura

### 🔧 Configurazione Bar

1. **Entità**: Seleziona un sensore numerico
2. **Nome**: Nome personalizzato (opzionale)
3. **Formula**: Espressione matematica per il valore
4. **Dimensione**: Compatta, Media, o Grande

### 📊 Formule Matematiche Disponibili

- `x` - Valore originale
- `x / 100` - Divide per 100
- `x * 100` - Moltiplica per 100
- `100 - x` - Inverte percentuale
- `Math.round(x)` - Arrotonda
- `x > 50 ? 100 : 0` - Condizionale

## Configurazione

Nessuna configurazione speciale richiesta. L'add-on funziona out-of-the-box.

## Supporto

Per problemi o domande, controlla i log dell'add-on nella sezione Log.
