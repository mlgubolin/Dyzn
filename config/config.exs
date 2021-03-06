# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dyzn,
  ecto_repos: [Dyzn.Repo]

# Configures the endpoint
config :dyzn, DyznWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jzvEwRB9xFuxGFQAKGkME5S0WaeEVopzIlFdTf7ACz8BFS6bsOQ+AJFS7C9Ej9dg",
  render_errors: [view: DyznWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Dyzn.PubSub,
  live_view: [signing_salt: "YPpJ3lGO"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
