#!/bin/bash

# Script di deploy per HA Fusion Custom
set -e

echo "🚀 Deploy HA Fusion Custom"
echo "=========================="

# Verifica se Docker è installato
if ! command -v docker &> /dev/null; then
    echo "❌ Docker non trovato. Installalo prima di continuare."
    exit 1
fi

# Ferma container esistente se presente
echo "🛑 Fermando container esistente..."
docker stop ha-fusion-custom 2>/dev/null || true
docker rm ha-fusion-custom 2>/dev/null || true

# Costruisci nuova immagine
echo "🔨 Costruendo immagine Docker..."
docker build -f Dockerfile.custom -t ha-fusion-custom .

# Crea directory data se non esiste
mkdir -p ./data

# Avvia nuovo container
echo "🌟 Avviando nuovo container..."
docker run -d \
  --name ha-fusion-custom \
  -p 5050:5050 \
  -v "$(pwd)/data:/app/data" \
  --restart unless-stopped \
  ha-fusion-custom

echo "✅ Deploy completato!"
echo "🌐 HA Fusion Custom disponibile su: http://localhost:5050"
echo "📁 Dati salvati in: $(pwd)/data"
