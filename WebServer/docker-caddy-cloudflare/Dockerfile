FROM caddy:2.8.4-builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4

COPY --from=0 /usr/bin/caddy /usr/bin/caddy

# COPY Caddyfile /etc/caddy/Caddyfile
