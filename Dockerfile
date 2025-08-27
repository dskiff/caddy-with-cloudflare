FROM caddy:2-builder@sha256:fe8d0d6cdbfd382197c4d715ffd5b41210165e2f64a81ce546ae63eeef35873a as builder
RUN xcaddy build  --with github.com/caddy-dns/cloudflare

FROM caddy:2@sha256:73ba793f1b2355cfefe2a7ec53ac2f2db0531bf52679deaf16df087fd35ce4ea
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
