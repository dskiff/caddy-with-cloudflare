FROM caddy:builder@sha256:150c52a85b5d63f5c5892c20725df06669e8abf749584bfc24d3fa92f28c3ab4 as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:b0a9578605b30ed6f6d75b66b31042628ca89707ef665385c100f7957a38b0f3
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
