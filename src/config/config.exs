use Mix.Config

config :football_api, FootballApiWeb.Endpoint,
  http: [port: System.get_env("PHX_HTTP_PORT")],
  url: [host: System.get_env("PHX_URL_HOST")],
  secret_key_base: System.get_env("PHX_SECRET_KEY_BASE"),
  render_errors: [view: FootballApiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FootballApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

import_config "#{Mix.env}.exs"
