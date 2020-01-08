defmodule PhoenixExample.MysqlRepo do
  @moduledoc """
  The MySQL handler
  """

  use Ecto.Repo,
    otp_app: :phoenix_example,
    adapter: Ecto.Adapters.MyXQL
end
