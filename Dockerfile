FROM caddy:builder@sha256:dd54498b9546c06cdafd0e3b20276e6999f07102cc1fb578f0408c3bf8399393 as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:07417b42b03b8929ec80240d1a83e27a9c1346ddbff65988608fd1757269c1eb
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
