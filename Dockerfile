FROM caddy:builder@sha256:8778619a8bfd796c5bafa16a1273e092612c57b34e25cb62d12ea6636f1ae252 as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:c6a5f2835a53fd9e2b5e0623dc7ebf0f89c163c21c05cbbc35e4ea31ff424417
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
