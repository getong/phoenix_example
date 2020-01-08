defmodule PhoenixExample.RedixRepo do
  @moduledoc """
  The redis handler
  """

  ## copy from https://hexdocs.pm/redix/real-world-usage.html#name-based-pool

  @pool_size 5

  def child_spec(_args) do
    # Specs for the Redix connections.
    redis_info = Application.get_env(:phoenix_example, :redis_info)

    children =
      for i <- 0..(@pool_size - 1) do
        Supervisor.child_spec({Redix, [{:name, :"redix_repo#{i}"} | redis_info]}, id: {Redix, i})
      end

    # Spec for the supervisor that will supervise the Redix connections.
    %{
      id: RedixSupervisor,
      type: :supervisor,
      start: {Supervisor, :start_link, [children, [strategy: :one_for_one]]}
    }
  end

  def command(command) do
    Redix.command(:"redix_repo#{random_index()}", command)
  end

  defp random_index() do
    rem(System.unique_integer([:positive]), @pool_size)
  end
end
