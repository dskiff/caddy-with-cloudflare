FROM caddy:2-builder@sha256:2cffe63dc72e3ea610f70a6bd4b11a4d1c873000e191f1bf59aae88d464906c5 as builder
RUN xcaddy build  --with github.com/caddy-dns/cloudflare

FROM caddy:2@sha256:ec18ee54aab3315c22e25f3b2babda73ff8007d39b13b3bd1bfffa2f0444c7d9
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
