FROM caddy:builder@sha256:62a63f27175da4481927333c7d3d8c59e29a2307a0b183b645ddfd6f79d03b7b as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:2c7c4a3b9534b34d598a02e7d2be61d3b3355fb77245aea43c27c6d93e09d55f
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
