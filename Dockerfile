FROM caddy:2-builder@sha256:703e7fdf46505950aa5863b491834e67a654d75d6b11186e62fffe07d3fcff81 as builder
RUN xcaddy build  --with github.com/caddy-dns/cloudflare

FROM caddy:2@sha256:a863d46cf06a9084f36cbffbe9f4ad046971dca32f79c68129aaf15ad356d6ce
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
