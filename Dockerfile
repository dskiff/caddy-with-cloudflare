FROM caddy:2-builder@sha256:57f45106467c6368822bf1bd20b335b3c41102212d350e813a691f8978151814 as builder
RUN xcaddy build  --with github.com/caddy-dns/cloudflare

FROM caddy:2@sha256:1c4bc9ead95a0888f1eea3a56ef79f30bd0d271229828fdd25090d898f553571
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
