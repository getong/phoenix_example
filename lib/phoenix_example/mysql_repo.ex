defmodule PhoenixExample.MysqlRepo do
  use Ecto.Repo,
    otp_app: :phoenix_example,
    adapter: Ecto.Adapters.MyXQL
end
