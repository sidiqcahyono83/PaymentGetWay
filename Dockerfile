# Dockerfile for PaymentGetWay (Bun runtime)

FROM oven/bun:alpine AS base

WORKDIR /app

# Copy manifests first for better layer caching
COPY package.json bun.lock ./

# Copy source
COPY . .

# Install production dependencies
RUN bun install --production

# Ensure uploads directory exists
RUN mkdir -p /app/uploads && chown -R bun:bun /app/uploads

USER bun

EXPOSE 3001

ENV NODE_ENV=production

# Healthcheck - hits root endpoint. Change to /healthz if you add a dedicated health route.
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:3001/ || exit 1

CMD ["bun", "index.ts"]
