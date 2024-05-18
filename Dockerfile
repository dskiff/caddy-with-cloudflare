FROM caddy:builder@sha256:c4ca919a359a82291778345c9886a9cf948d4e4613aee402066f0be8819179ff as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:3c83eb593c903dfac5e896c6647e9a473de4a0c31298f6ab435c1b461f71e03c
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
