defmodule PhoenixExample.ATableContext.ATable do
  @moduledoc """
  The BTable schema
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "a_table" do
    field :name, :string
    field :password, :string

    # timestamps()
    timestamps(type: :utc_datetime_usec)
  end

  @doc false
  def changeset(a_table, attrs) do
    a_table
    |> cast(attrs, [:name, :password])
    |> validate_required([:name, :password])
  end
end
