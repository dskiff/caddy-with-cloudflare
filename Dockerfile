FROM caddy:builder@sha256:2f44de947418f8155bcf3c84397083bd0deb61eb19efa39094184fa7c53b68e4 as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:7414db60780a20966cd9621d1dcffcdcef060607ff32ddbfde2a3737405846c4
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
