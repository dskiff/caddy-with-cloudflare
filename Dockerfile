FROM caddy:2-builder@sha256:8910fe662f448b860e8d16ef1c9a4f8946d3193bdc3e971bf0c55c9a2cf246f6 as builder
RUN xcaddy build  --with github.com/caddy-dns/cloudflare

FROM caddy:2@sha256:504a44d7d74bd2bc28a66afc4774912fc21223ca8a67734af1c54ab2f999b489
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
