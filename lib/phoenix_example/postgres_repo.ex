defmodule PhoenixExample.PostgresRepo do
  @moduledoc """
  The Postgres handler
  """

  use Ecto.Repo,
    otp_app: :phoenix_example,
    adapter: Ecto.Adapters.Postgres
end
