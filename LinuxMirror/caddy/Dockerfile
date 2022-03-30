FROM caddy:2.5.0-beta.1-builder-alpine AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.5.0-beta.1-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

#COPY Caddyfile /etc/caddy/Caddyfile
