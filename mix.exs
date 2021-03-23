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
      {:phoenix, "~> 1.5"},
      {:phoenix_ecto, "~> 4.2"},
      {:phoenix_html, "~> 2.14"},
      {:phoenix_live_reload, "~> 1.3", only: :dev},
      {:phoenix_live_view, "~> 0.15.0"},
      {:phoenix_live_dashboard, "~> 0.4.0"},
      {:ecto_sql, "~> 3.5"},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 0.5.1"},
      {:myxql, "~> 0.4"},
      {:geo, "~> 3.3"},
      {:postgrex, "~> 0.15"},
      {:gettext, "~> 0.18"},
      {:jason, "~> 1.2"},
      {:plug_cowboy, "~> 2.4"},
      {:ranch, "~> 2.0", override: true},
      {:absinthe_plug, "~> 1.5"},
      {:quantum, "~> 3.3"},
      {:logger_file_backend, "~> 0.0.11"},
      {:distillery, "~> 2.1", runtime: false},
      {:elasticsearch, "~> 1.0"},
      {:libcluster, "~> 3.2"},
      {:redix, "~> 1.0"},
      {:snappyer, "~> 1.2"},
      ## {:kafka_ex, "~> 0.10.0"},
      ## {:gen_amqp, "~> 7.0"},
      {:amqp, "~> 1.6", override: true},
      {:prometheus, "~> 4.6"},
      {:neuron, "~> 5.0"},
      {:ra, "~> 1.1"},
      {:credo, "~> 1.5", only: [:dev, :test]},
      {:vex, github: "CargoSense/vex", override: true},
      {:spg, "~> 1.1"},
      {:mongodb, "~> 0.5"},
      {:protobuf, "~> 0.7"},
      {:cowlib, "~> 2.9", override: true},
      {:gun, "~> 1.3", override: true},
      {:emqtt, "~> 1.2"},
      {:oban, "~> 2.4"},
      {:bolt_sips, "~> 2.0"},
      {:flow, "~> 1.1"},
      {:broadway, "~> 0.6.2"},
      {:pelemay, "~> 0.0.13"},
      {:peerage, "~> 1.0"},
      {:contex, "~> 0.3.0"},
      {:rustler, "~> 0.22.0-rc.0"},
      {:saxy, "~> 1.3"},
      {:finch, "~> 0.6.3"},
      {:msgpax, "~> 2.2"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup", "cmd npm install --prefix assets"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
    ]
  end
end
