FROM caddy:2-builder@sha256:9edca605c07c8b5425d1985b4d4a1796329b11c3eba0b55f938e01916dcd96c8 as builder
RUN xcaddy build  --with github.com/caddy-dns/cloudflare

FROM caddy:2@sha256:cd038960363e661b805a40ee6d03ba98608538f197c08cb915cb4af89e23a5b4
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
