# ========================
# Build Stage
# ========================
FROM node:20-alpine AS builder

WORKDIR /app

# Install only prod dependencies
COPY package*.json ./
RUN npm ci --only=production

# Copy application source
COPY src ./src

# ========================
# Runtime Stage (Distroless)
# ========================
FROM gcr.io/distroless/nodejs20-debian12

WORKDIR /app

# Copy node_modules and app from builder
COPY --from=builder /app /app

# Distroless already runs as non-root
EXPOSE 3000

CMD ["src/server.js"]
