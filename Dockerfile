FROM caddy:2-builder@sha256:34466183d881df9a8226caf360ff86fe50456f0971221b127dcb756cf514e1ea as builder
RUN xcaddy build  --with github.com/caddy-dns/cloudflare

FROM caddy:2@sha256:f2a1290d0463aad60660d4ec134943f183ee2a5f6c3eb7bf32dd984f2f020772
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
