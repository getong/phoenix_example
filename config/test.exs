import Mix.Config

# Configure your database
config :phoenix_example, PhoenixExample.Repo,
  username: "postgres",
  password: "postgres",
  database: "phoenix_example_test",
  hostname: "postgres",
  pool: Ecto.Adapters.SQL.Sandbox

config :phoenix_example, PhoenixExample.MysqlRepo,
  username: "root",
  password: "zan3Kie1",
  database: "test_db",
  hostname: "mariadb",
  port: 3306

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_example, PhoenixExampleWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
