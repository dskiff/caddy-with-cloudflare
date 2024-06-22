FROM caddy:builder@sha256:0ad6668f14eb3b6e12f232284473a07d5afebc3b3e9c6c3b928e4b5c6c97f235 as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:60199fbf2046892e0aa4b19c7d3adf71f530c36abc65728627422148a75b3475
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
