FROM caddy:builder@sha256:150c52a85b5d63f5c5892c20725df06669e8abf749584bfc24d3fa92f28c3ab4 as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:2ae8f7fcd4d82d1c5c1c4dc45ad5f24ab1c1f3af4dd6db03a83d126047d7a939
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
