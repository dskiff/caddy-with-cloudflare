FROM caddy:2-builder@sha256:0d8a627cc17a38e15fb1a399337a14c9a47bf10b37dbb1334cf15697b0dbe7b3 as builder
RUN xcaddy build  --with github.com/caddy-dns/cloudflare

FROM caddy:2@sha256:7f0336b2c9930a6d84529303563d65880072938c538a9a7713dbffa0f876c951
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
