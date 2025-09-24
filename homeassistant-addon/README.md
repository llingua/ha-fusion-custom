# Come installare HA Fusion Custom su Home Assistant OS

## Struttura Directory da Creare

Su Home Assistant, crea questa struttura in `/config/addons/`:

```
/config/addons/ha-fusion-custom/
├── config.yaml
├── Dockerfile
├── build.yaml
├── CHANGELOG.md
├── DOCS.md
├── README.md
└── rootfs/
    └── [tutti i file del progetto ha-fusion]
```

## Passo-by-Passo

1. Accedi a Home Assistant via SSH o File Editor
2. Crea la directory: `mkdir -p /config/addons/ha-fusion-custom/rootfs`
3. Copia tutti i file di ha-fusion in `rootfs/`
4. Copia i file di configurazione dell'add-on
5. Riavvia Home Assistant
6. Installa l'add-on da Supervisor

## File da Copiare

### In `/config/addons/ha-fusion-custom/`:

- config.yaml (configurazione add-on)
- Dockerfile (istruzioni build)
- build.yaml (configurazione build)

### In `/config/addons/ha-fusion-custom/rootfs/`:

- Tutti i file del progetto ha-fusion modificato
- package.json, src/, static/, ecc.
