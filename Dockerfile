# ===============================
# Stage 1: Install dependencies
# ===============================
FROM node:20-alpine AS builder

WORKDIR /app

RUN apk add --no-cache git

# Copy dependency files
# COPY package*.json ./

# Copy application source
COPY . .


# ===============================
# Stage 2: Runtime image
# ===============================
FROM node:20-alpine

# Create non-root user (security best practice)
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

# Copy app from builder
COPY --from=builder /app /app

# Permissions
RUN chown -R appuser:appgroup /app

RUN apk update
RUN apk add --no-cache npm
RUN npm install

USER appuser

EXPOSE 3000

CMD ["node", "server.js"]
