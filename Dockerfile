# Stage 1: Build the Zola site
FROM ghcr.io/getzola/zola:v0.19.2 AS builder
WORKDIR /app
COPY . .
RUN ["zola", "build"]

# Stage 2: Serve with Caddy
FROM caddy:2-alpine
COPY --from=builder /app/public /srv
COPY <<'EOF' /etc/caddy/Caddyfile
:{$PORT}
root * /srv
file_server
try_files {path} {path}/ /index.html
EOF
