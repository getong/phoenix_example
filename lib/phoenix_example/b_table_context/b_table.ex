defmodule PhoenixExample.BTableContext.BTable do
  @moduledoc """
  The ATable schema
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "b_table" do
    field :age, :integer
    field :name, :string

    # timestamps()
    timestamps(type: :utc_datetime_usec)
  end

  @doc false
  def changeset(b_table, attrs) do
    b_table
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
  end
end
