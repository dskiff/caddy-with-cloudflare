FROM caddy:2-builder@sha256:c7237a4e4b7d31b697a8672c7418be98471a3f30f44477e3fa36b9d16df35797 as builder
RUN xcaddy build  --with github.com/caddy-dns/cloudflare

FROM caddy:2@sha256:c5876b163e84c44815e2fbba68245367dcf341a15947f80bffffa011bdc90ece
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
