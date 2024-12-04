FROM caddy:builder@sha256:2408adf1a3ceaf1df7e004686860186e3f9f44923ce7b2d96289883fceb045a1 as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:07417b42b03b8929ec80240d1a83e27a9c1346ddbff65988608fd1757269c1eb
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
