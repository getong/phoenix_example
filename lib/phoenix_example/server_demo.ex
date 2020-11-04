defmodule PhoenixExample.ServerDemo do
##  ## copy from https://hexdocs.pm/gen_amqp/GenAMQP.html#content
  @moduledoc false
##
##  use GenAMQP.Server,
##    event: "server_demo",
##    conn_name: Application.get_env(:gen_amqp, :conn_name),
##    size: 10
##
##  @impl true
##  def execute(_payload, _map_state) do
##    with {:ok, _} <- {:error, "error"} do
##      {:reply, "ok"}
##    end
##  end
##
##  def handle({:error, cause}) do
##    {:reply, cause}
##  end
end
