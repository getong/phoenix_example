# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Mix.Config

config :phoenix_example,
  ecto_repos: [PhoenixExample.Repo]

# Configures the endpoint
config :phoenix_example, PhoenixExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "f4M8HRiXYLj9MUHe4w/WZ8E5H7WZG+kkLS9IR0+c5r5cF09CC2SwV7WYqm2rm7Cd",
  render_errors: [view: PhoenixExampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixExample.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
