FROM caddy:2-builder@sha256:2223a2b14c52cd3d6054cbb97b14d57e9ae6b06d5fe3f72102bd50be01adca88 as builder
RUN xcaddy build  --with github.com/caddy-dns/cloudflare

FROM caddy:2@sha256:1972548f05660a069cfdf052aa2b923ce691627cbad1b7b97fb0a18533a766f2
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
