FROM caddy:builder@sha256:0d8a627cc17a38e15fb1a399337a14c9a47bf10b37dbb1334cf15697b0dbe7b3 as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:d17c155b627f4ae14cef9cb4143b63c529a8497966b62febcde79f4ecc3857f7
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
