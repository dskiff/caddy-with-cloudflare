FROM caddy:builder@sha256:1b98f3fd892c1605c157cc3a049bded9d706ffd51d9a753e18ab07510d0d9e2a AS builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:a6054d207060158cd0f019d6a35907bf47d1f8dacf58cdb63075a930d8ebca38
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
