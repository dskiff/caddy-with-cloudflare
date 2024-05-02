FROM caddy:builder@sha256:c684ed61b9173b0b27528dad7fa023a25218f2aa160ca22f003256404e7ae359 as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:ca031cd33c788ebe467c94348400e5bf263178f9619f3993af8373f18681b8fd
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
