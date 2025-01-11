FROM caddy:builder@sha256:0d8a627cc17a38e15fb1a399337a14c9a47bf10b37dbb1334cf15697b0dbe7b3 as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:37a59e2006021239655da30d05bdcf27322bc85bd92284c1379551caacad432c
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
