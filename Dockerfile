FROM caddy:builder@sha256:fb492c5c699ceb5a0cd99a25034cf910cb9ec22e96da13c62b4beff1c99b248d as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:9a8e0e6f0f0af954626903b1ae5aac3536f45222131c01e1f2433e8b1ecb3937
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
