defmodule PhoenixExample.BTableContext.BTable do
  use Ecto.Schema
  import Ecto.Changeset

  schema "b_table" do
    field :age, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(b_table, attrs) do
    b_table
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
  end
end
