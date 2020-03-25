defmodule PhoenixExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :phoenix_example,
      version: "0.1.0",
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      elixirc_options: [warnings_as_errors: true],
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {PhoenixExample.Application, []},
      extra_applications: [:lager, :logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_ecto, "~> 4.1"},
      {:ecto_sql, "~> 3.4"},
      {:myxql, "~> 0.3.2"},
      {:geo, "~> 3.3"},
      {:postgrex, "~> 0.15.3"},
      {:phoenix_html, "~> 2.14"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:gettext, "~> 0.17.4"},
      {:jason, "~> 1.2"},
      {:plug_cowboy, "~> 2.1"},
      {:absinthe_plug, "~> 1.4"},
      {:quantum, "~> 2.4"},
      {:logger_file_backend, "~> 0.0.11"},
      {:distillery, "~> 2.1", runtime: false},
      {:elasticsearch, "~> 1.0"},
      {:libcluster, "~> 3.2"},
      {:redix, "~> 0.10.4"},
      {:snappy, "~> 1.1"},
      ## {:kafka_ex, "~> 0.10.0"},
      {:gen_amqp, "~> 7.0"},
      {:amqp, "~> 1.4", override: true},
      {:prometheus, "~> 4.5"},
      {:neuron, "~> 4.1"},
      {:ra, "~> 1.0"},
      {:credo, "~> 1.3", only: [:dev, :test]},
      {:vex, github: "CargoSense/vex", override: true},
      {:spg, "~> 1.1"},
      {:mongodb, "~> 0.5.1"},
      {:protobuf, "~> 0.7.1"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
