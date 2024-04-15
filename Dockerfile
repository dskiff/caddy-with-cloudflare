FROM caddy:builder@sha256:d8a2ad006009b25b7017ab7190128cdd3a0fccee518f5b14fe6c749c6a6293b8 as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:ca031cd33c788ebe467c94348400e5bf263178f9619f3993af8373f18681b8fd
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
