FROM caddy:builder@sha256:fe45985056ead0e8226825284ccab1855ccdd4e9fc9c656175a494fe02b21c1a as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:c6a5f2835a53fd9e2b5e0623dc7ebf0f89c163c21c05cbbc35e4ea31ff424417
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
