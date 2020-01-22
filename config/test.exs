import Mix.Config

# Configure your database
config :phoenix_example, PhoenixExample.PostgresRepo,
  username: "postgres",
  password: "postgres",
  database: "phoenix_example_test",
  hostname: "localhost",
  port: 5432,
  pool: Ecto.Adapters.SQL.Sandbox

config :phoenix_example, PhoenixExample.MysqlRepo,
  username: "root",
  password: "zan3Kie1",
  database: "test_db",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  port: 3306

config :phoenix_example, :mongodb_info,
  url: "127.0.0.1",
  username: "mongoadmin",
  password: "Iushahb0",
  port: 27017,
  database: "admin",
  name: :mongo,
  pool_size: 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_example, PhoenixExampleWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
