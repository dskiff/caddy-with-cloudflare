FROM caddy:2-builder@sha256:6e7a8ab47f8663a71e07458bf7f58e258fda81697a5af99e9eb836d9341a953a as builder
RUN xcaddy build  --with github.com/caddy-dns/cloudflare

FROM caddy:2@sha256:c5876b163e84c44815e2fbba68245367dcf341a15947f80bffffa011bdc90ece
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
