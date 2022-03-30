FROM caddy:2.5.0-beta.1-builder AS builder

RUN xcaddy build \
    -- with https://github.com/caddy-dns/cloudflare

FROM caddy:2.5.0-beta.1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

#COPY Caddyfile /etc/caddy/Caddyfile