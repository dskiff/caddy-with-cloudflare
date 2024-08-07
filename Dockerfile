FROM caddy:builder@sha256:202faaa291d9da41346fbb03609827e9e8004e7c74b3c1bbb5c1248575958da1 as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:b8c90e126558630ac99b6df3daf4aa261e80dd0bd28f8b4882be4f31d783706d
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
