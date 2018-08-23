use Mix.Config

config :football_api, FootballApiWeb.Endpoint,
  http: [port: "${PHX_HTTP_PORT}"],
  url: [host: "${PHX_URL_HOST}", port: 443],
  secret_key_base: "${PHX_SECRET_KEY_BASE}",
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true,
  root: ".",
  version: Mix.Project.config[:version]

config :logger, level: :info
