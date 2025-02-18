FROM caddy:2-builder@sha256:c293af6a9b5a979534765f31611267f47a2af6a7268641dec398e567605e00cf as builder
RUN xcaddy build  --with github.com/caddy-dns/cloudflare

FROM caddy:2@sha256:1c4bc9ead95a0888f1eea3a56ef79f30bd0d271229828fdd25090d898f553571
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
