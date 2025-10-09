FROM caddy:2-builder@sha256:13bf132b50ab5a3abd4d62d4da27a9d8fd98818028746fe85e745d73e3e71f3d as builder
RUN xcaddy build  --with github.com/caddy-dns/cloudflare

FROM caddy:2@sha256:614bbc6da7ec42f3c76077e86f429297047680f9cb420ad0f07a8fe049193d89
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
