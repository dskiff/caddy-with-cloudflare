FROM caddy:builder@sha256:5e05b57b569a3b9a19567321e839560e49a559f31442f92f92c411086ce9e190 as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:b0a9578605b30ed6f6d75b66b31042628ca89707ef665385c100f7957a38b0f3
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
