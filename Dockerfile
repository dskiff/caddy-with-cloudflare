FROM caddy:builder@sha256:0b67771fda573b19475cd37797852879f0446d5b9f9d93f0b1c81f80d659d71a as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:07417b42b03b8929ec80240d1a83e27a9c1346ddbff65988608fd1757269c1eb
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
