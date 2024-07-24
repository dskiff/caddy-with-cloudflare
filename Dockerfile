FROM caddy:builder@sha256:47b907b736ace7019dfc5533b8525d0be351a66e2dc1123d3bfe82059613d9ad as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:d4c3d1d98f070f36d21eff1e7521edb718704a9f906618708b06946b9eb4f448
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
