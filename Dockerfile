FROM caddy:builder@sha256:37acf9e88ea74ef051bc1ec68ea9abd535320ea4eea1a0162aaf378ee5200a3c as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:236c6a30ccb84fa412a5360ca8b586d804faba0621ea182fb45902608cd8a563
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
