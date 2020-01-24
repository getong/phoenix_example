# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Mix.Config

config :phoenix_example,
  ecto_repos: [PhoenixExample.PostgresRepo, PhoenixExample.MysqlRepo],
  redis_info: [host: "localhost", port: 6379, password: "TaeT9ahc"],
  start_elasticsearch: true

# Configures the endpoint
config :phoenix_example, PhoenixExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "f4M8HRiXYLj9MUHe4w/WZ8E5H7WZG+kkLS9IR0+c5r5cF09CC2SwV7WYqm2rm7Cd",
  render_errors: [view: PhoenixExampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixExample.PubSub, adapter: Phoenix.PubSub.PG2],
  ## copy from https://hexdocs.pm/phoenix/endpoint.html
  https: [
    port: 4001,
    otp_app: :phoenix_example,
    keyfile: "priv/cert/selfsigned_key.pem",
    certfile: "priv/cert/selfsigned.pem"
    # OPTIONAL Key for intermediate certificates:
    # cacertfile: "priv/cert/selfsigned.pem"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configure your database
config :phoenix_example, PhoenixExample.PostgresRepo,
  username: "postgres",
  password: "postgres",
  database: "phoenix_example_test",
  hostname: "localhost",
  port: 5432,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :phoenix_example, PhoenixExample.MysqlRepo,
  username: "root",
  password: "zan3Kie1",
  database: "test_db",
  hostname: "localhost",
  port: 3306,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

## copy from https://hexdocs.pm/elasticsearch/readme.html
config :phoenix_example, PhoenixExample.ElasticsearchCluster,
  # The URL where Elasticsearch is hosted on your system
  url: "http://localhost:9200",

  # If you want to mock the responses of the Elasticsearch JSON API
  # for testing or other purposes, you can inject a different module
  # here. It must implement the Elasticsearch.API behaviour.
  api: Elasticsearch.API.HTTP,

  # Customize the library used for JSON encoding/decoding.
  # or Jason
  json_library: Jason,
  default_options: [
    timeout: 15_000,
    recv_timeout: 15_000
  ]

config :phoenix_example, :mongodb_info,
  url: "127.0.0.1",
  username: "mongoadmin",
  password: "Iushahb0",
  port: 27017,
  database: "admin",
  name: :mongo,
  pool_size: 2

config :gen_amqp,
  connections: [
    {:static, StaticConnSup, [ConnHub: "amqp://user:Anaith7x@localhost:5672/vhost_name"]}
  ],
  error_handler: ErrorHandler

config :phoenix_example, PhoenixExample.CronScheduler,
  jobs: [
    # Every minute
    # {"* * * * *",      {Heartbeat, :send, []}}
  ]

config :lager,
  error_logger_redirect: false,
  handlers: [level: :cirtical]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
