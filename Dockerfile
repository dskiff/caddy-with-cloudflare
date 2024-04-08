FROM caddy:builder@sha256:337a28e320ef730ff4b2ef87ddf4702710240940a30f236059259925de47bba2 AS builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:d8d3637a26f50bf0bd27a6151d2bd4f7a9f0455936fe7ca2498abbc2e26c841e
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
