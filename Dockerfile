FROM caddy:builder@sha256:d7e608292c9c1b4b0f96502f9451afca67f9268c7a04b8af5c75ca71c02d5b8b as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:3c83eb593c903dfac5e896c6647e9a473de4a0c31298f6ab435c1b461f71e03c
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
