FROM caddy:builder@sha256:47b907b736ace7019dfc5533b8525d0be351a66e2dc1123d3bfe82059613d9ad as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:b8c90e126558630ac99b6df3daf4aa261e80dd0bd28f8b4882be4f31d783706d
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
