FROM caddy:2-builder@sha256:b33f07bbf5f8a431f224b3df0f0e709f4c7cb484515df2cdf71218e6e6021205 as builder
RUN xcaddy build  --with github.com/caddy-dns/cloudflare

FROM caddy:2@sha256:73ba793f1b2355cfefe2a7ec53ac2f2db0531bf52679deaf16df087fd35ce4ea
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
