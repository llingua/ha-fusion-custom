#!/bin/bash

# Script per deploy su Home Assistant OS
set -e

echo "🏠 Deploy HA Fusion Custom su Home Assistant OS"
echo "==============================================="

# Verifica parametri
if [ $# -lt 1 ]; then
    echo "❌ Uso: $0 <IP_HOME_ASSISTANT> [USERNAME]"
    echo "   Esempio: $0 192.168.1.100 root"
    exit 1
fi

HA_IP="$1"
HA_USER="${2:-root}"
ADDON_NAME="ha-fusion-custom"

echo "📡 Target: $HA_USER@$HA_IP"
echo "📦 Add-on: $ADDON_NAME"

# Crea pacchetto temporaneo
echo "📦 Preparazione pacchetto..."
TEMP_DIR="/tmp/ha-fusion-addon-$$"
mkdir -p "$TEMP_DIR/$ADDON_NAME"

# Copia file addon
cp -r homeassistant-addon/* "$TEMP_DIR/$ADDON_NAME/"

# Crea directory rootfs e copia progetto
mkdir -p "$TEMP_DIR/$ADDON_NAME/rootfs"
rsync -av --exclude='node_modules' --exclude='.git' --exclude='homeassistant-addon' --exclude='addon' . "$TEMP_DIR/$ADDON_NAME/rootfs/"

# Crea archivio
cd "$TEMP_DIR"
tar -czf "$ADDON_NAME.tar.gz" "$ADDON_NAME"

echo "📤 Upload su Home Assistant..."

# Upload archivio
scp "$ADDON_NAME.tar.gz" "$HA_USER@$HA_IP:/tmp/"

# Estrai e installa
ssh "$HA_USER@$HA_IP" << EOF
echo "📁 Creazione directory add-on..."
mkdir -p /config/addons

echo "🗂️ Rimozione versione precedente..."
rm -rf /config/addons/$ADDON_NAME

echo "📦 Estrazione add-on..."
cd /config/addons
tar -xzf /tmp/$ADDON_NAME.tar.gz

echo "🔧 Impostazione permessi..."
chmod +x /config/addons/$ADDON_NAME/run.sh

echo "🧹 Pulizia file temporanei..."
rm /tmp/$ADDON_NAME.tar.gz

echo "✅ Add-on installato in /config/addons/$ADDON_NAME"
EOF

# Pulizia locale
rm -rf "$TEMP_DIR"

echo ""
echo "🎉 Deploy completato!"
echo ""
echo "📋 Prossimi passi:"
echo "1. 🔄 Riavvia Home Assistant"
echo "2. 🏪 Vai in Supervisor > Add-on Store"
echo "3. ⋮ Menu > Repositories > Aggiungi: file:///config/addons/$ADDON_NAME"
echo "4. 🔍 Cerca 'HA Fusion Custom' e installalo"
echo "5. ▶️ Avvia l'add-on"
echo "6. 🌐 Accedi tramite 'OPEN WEB UI'"
echo ""
