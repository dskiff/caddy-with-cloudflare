FROM caddy:builder@sha256:202faaa291d9da41346fbb03609827e9e8004e7c74b3c1bbb5c1248575958da1 as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:1841e7c656154710f2fec273e12d4e517eeea5bd7a6c75e01dd26b88aaba9646
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
