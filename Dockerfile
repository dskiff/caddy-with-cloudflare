FROM caddy:builder@sha256:b1ee6157da9ce89796a6ce266713d701b383a17db2fa9cdb6dac04ef157544c8 as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:b8c90e126558630ac99b6df3daf4aa261e80dd0bd28f8b4882be4f31d783706d
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
