FROM caddy:builder@sha256:c4ca919a359a82291778345c9886a9cf948d4e4613aee402066f0be8819179ff as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:236c6a30ccb84fa412a5360ca8b586d804faba0621ea182fb45902608cd8a563
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
