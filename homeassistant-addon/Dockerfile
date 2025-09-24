ARG BUILD_FROM
FROM ${BUILD_FROM}

# Installa Node.js e pnpm
RUN apk add --no-cache \
    nodejs \
    npm \
    git

# Installa pnpm globalmente
RUN npm install -g pnpm

# Crea directory di lavoro
WORKDIR /app

# Copia il progetto ha-fusion personalizzato
COPY rootfs/ /app/

# Installa dipendenze
RUN pnpm install --frozen-lockfile

# Build del progetto
RUN pnpm build

# Crea directory per dati persistenti
RUN mkdir -p /app/data

# Script di avvio
COPY run.sh /
RUN chmod a+x /run.sh

# Esponi porta
EXPOSE 5050

# Comando di avvio
CMD ["/run.sh"]
