FROM caddy:builder@sha256:b1ee6157da9ce89796a6ce266713d701b383a17db2fa9cdb6dac04ef157544c8 as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:b0a9578605b30ed6f6d75b66b31042628ca89707ef665385c100f7957a38b0f3
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
