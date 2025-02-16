FROM caddy:2-builder@sha256:4acea926083a7bc7a4aca4250cec68c9dd6d4a6dc66c6ca8e26ceb1041bca86a as builder
RUN xcaddy build  --with github.com/caddy-dns/cloudflare

FROM caddy:2@sha256:262e1d7bb9d6fb55a7310a9365213a73365dcdea90380eb601d33d8b3964fcea
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
