FROM caddy:builder@sha256:2408adf1a3ceaf1df7e004686860186e3f9f44923ce7b2d96289883fceb045a1 as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:d17c155b627f4ae14cef9cb4143b63c529a8497966b62febcde79f4ecc3857f7
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
