FROM bitwalker/alpine-elixir-phoenix
RUN apk --no-cache add -U musl musl-dev ncurses-libs libressl2.7-libcrypto bash
