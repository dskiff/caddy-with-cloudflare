FROM caddy:builder@sha256:9bbe944a171a6d4b0003c78ce7f28654d6886e292f7575e2be582668e11dc415 as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:c6a5f2835a53fd9e2b5e0623dc7ebf0f89c163c21c05cbbc35e4ea31ff424417
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
