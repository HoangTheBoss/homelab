FROM caddy:2.8.4 AS base

FROM caddy:2.8.4-builder AS builder
RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM base
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
