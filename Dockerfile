FROM caddy:builder@sha256:0b67771fda573b19475cd37797852879f0446d5b9f9d93f0b1c81f80d659d71a as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:63d8776389cc6527e4a23bd9750489dc661923cffc3b9d7e0c20e062fa0325ec
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
