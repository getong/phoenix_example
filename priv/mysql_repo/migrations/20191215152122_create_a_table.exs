defmodule PhoenixExample.Repo.Migrations.CreateATable do
  use Ecto.Migration

  def change do
    create table(:a_table) do
      add :name, :string
      add :password, :string

      ## timestamps()
      timestamps(type: :timestamptz)
    end
  end
end
