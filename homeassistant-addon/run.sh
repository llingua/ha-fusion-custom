#!/usr/bin/with-contenv bashio

# Configurazione logging
bashio::log.info "Avvio HA Fusion Custom..."

# Vai nella directory dell'app
cd /app

# Crea file .env se non esiste
if [ ! -f "/app/.env" ]; then
    bashio::log.info "Creazione file .env..."
    echo "HASSIO_TOKEN=${SUPERVISOR_TOKEN}" > /app/.env
    echo "ORIGIN=http://supervisor:5050" >> /app/.env
fi

# Assicurati che la directory data esista
mkdir -p /app/data

# Controlla se il build esiste
if [ ! -d "/app/build" ]; then
    bashio::log.error "Build non trovato! Esegui 'pnpm build' prima dell'installazione."
    exit 1
fi

# Avvia l'applicazione
bashio::log.info "Avvio dell'applicazione su porta 5050..."
exec node build
