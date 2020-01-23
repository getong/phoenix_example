defmodule PhoenixExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  alias Supervisor.Spec

  def start(_type, _args) do
    # List all child processes to be supervised

    ## copy from https://www.poeticoding.com/connecting-elixir-nodes-with-libcluster-locally-and-on-kubernetes/
    topologies = [
      chat: [
        strategy: Cluster.Strategy.Gossip
      ]
    ]

    mongodb_connection_info = Application.get_env(:phoenix_example, :mongodb_info)

    children = [
      {Cluster.Supervisor, [topologies, [name: PhoenixExample.ClusterSupervisor]]},

      # Start the Ecto repository
      PhoenixExample.PostgresRepo,
      {PhoenixExample.MysqlRepo, []},
      PhoenixExample.RedixRepo,
      # Start the endpoint when the application starts
      PhoenixExampleWeb.Endpoint,
      # Starts a worker by calling: PhoenixExample.Worker.start_link(arg)
      # {PhoenixExample.Worker, arg},
      Spec.worker(Mongo, [mongodb_connection_info]),
      # PhoenixExample.ElasticsearchCluster,
      PhoenixExample.CronScheduler
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PhoenixExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
