ARG BUILD_FROM
FROM $BUILD_FROM

# Installa Node.js
RUN apk add --no-cache nodejs npm

# Installa pnpm
RUN npm install -g pnpm

# Copia i file
WORKDIR /app
COPY . .

# Installa dipendenze e builda
RUN pnpm install
RUN pnpm build

# Esponi porta
EXPOSE 5050

# Avvia applicazione
CMD ["node", "build"]
