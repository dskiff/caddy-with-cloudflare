FROM caddy:2-builder@sha256:5ffdd1eb7c262d118977dfd8c4a0c34c7781366fbadef3b4daeac459cb30e99e as builder
RUN xcaddy build  --with github.com/caddy-dns/cloudflare

FROM caddy:2@sha256:786b7527345b82faf39e664ea26c71cc57bcb3a89bb2eada94bf0b2dc5304f0a
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
