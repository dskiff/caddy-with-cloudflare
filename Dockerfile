FROM caddy:2-builder@sha256:84c64e5704f0b7366f0721cd9f5e6be155e824126dd12fe3f0fd7d6ea996b78b as builder
RUN xcaddy build  --with github.com/caddy-dns/cloudflare

FROM caddy:2@sha256:748016f285ed8c43a9ce6e3aed6d92d3009d90ca41157950880f40beaf3ff62b
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
