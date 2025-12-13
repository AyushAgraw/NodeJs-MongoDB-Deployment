# Stage 1: Build
FROM node:20-alpine AS builder
WORKDIR /app

# Install dependencies
COPY app/package*.json ./
RUN npm install --omit=dev
RUN npm ci --production

# Copy source code
COPY . .

# Stage 2: Final
FROM node:20-alpine

# Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

# Copy only necessary artifacts
COPY --from=builder /app /app
COPY --from=builder /app/node_modules /app/node_modules

# Change ownership
RUN chown -R appuser:appgroup /app

# Switch to non-root user
USER appuser

EXPOSE 3000
CMD ["node", "index.js"]
