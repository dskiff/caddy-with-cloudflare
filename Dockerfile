FROM caddy:builder@sha256:3e225bb553d4a38be7a952d007da2ee78c4567b5b4380592041325446eb37420 as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:37a59e2006021239655da30d05bdcf27322bc85bd92284c1379551caacad432c
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
