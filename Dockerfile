FROM caddy:2-builder@sha256:3e225bb553d4a38be7a952d007da2ee78c4567b5b4380592041325446eb37420 as builder
RUN xcaddy build  --with github.com/caddy-dns/cloudflare

FROM caddy:2@sha256:a863d46cf06a9084f36cbffbe9f4ad046971dca32f79c68129aaf15ad356d6ce
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
