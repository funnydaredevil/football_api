FROM bitwalker/alpine-elixir-phoenix:latest
RUN apk --no-cache add -U musl musl-dev ncurses-libs libressl2.7-libcrypto bash

# Install Hex+Rebar
RUN mix local.hex --force && \
  mix local.rebar --force