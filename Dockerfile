FROM caddy:builder@sha256:efb0a066246f690811b6063d74e5ba633f62286ed15f39f6eb3d05c2a870a2fe as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:2c7c4a3b9534b34d598a02e7d2be61d3b3355fb77245aea43c27c6d93e09d55f
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
