FROM caddy:2.5.0-beta.1-builder AS builder

RUN xcaddy build 2.5.0-beta.1 \
    -- with dns.providers.cloudflare

FROM caddy:2.5.0-beta.1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

#COPY Caddyfile /etc/caddy/Caddyfile
