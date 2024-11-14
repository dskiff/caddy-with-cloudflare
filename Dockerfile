FROM caddy:builder@sha256:0b67771fda573b19475cd37797852879f0446d5b9f9d93f0b1c81f80d659d71a as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:cb50cf1d7c80d0dd310ce9ab0f2726706d82d3390bbd617bc213ef00377a8a70
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
