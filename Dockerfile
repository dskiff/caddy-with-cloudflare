FROM caddy:builder@sha256:9bbe944a171a6d4b0003c78ce7f28654d6886e292f7575e2be582668e11dc415 as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:2ae8f7fcd4d82d1c5c1c4dc45ad5f24ab1c1f3af4dd6db03a83d126047d7a939
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
