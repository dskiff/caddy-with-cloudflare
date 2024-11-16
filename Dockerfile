FROM caddy:builder@sha256:f21e5c514adb7a81bb3e22f0a22d6a2bd51186291753581ad991ff033be9fc3e as builder
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:cb50cf1d7c80d0dd310ce9ab0f2726706d82d3390bbd617bc213ef00377a8a70
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD [ "caddy" ]
