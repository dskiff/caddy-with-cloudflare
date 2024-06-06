FROM caddy:builder@sha256:2f44de947418f8155bcf3c84397083bd0deb61eb19efa39094184fa7c53b68e4 as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:9a8e0e6f0f0af954626903b1ae5aac3536f45222131c01e1f2433e8b1ecb3937
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
