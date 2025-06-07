FROM caddy:2-builder@sha256:c7237a4e4b7d31b697a8672c7418be98471a3f30f44477e3fa36b9d16df35797 as builder
RUN xcaddy build  --with github.com/caddy-dns/cloudflare

FROM caddy:2@sha256:30ccf0cb027e1d06cd6e453c04fc1c8eec665629b22ed69602c14c8a0512ead0
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
