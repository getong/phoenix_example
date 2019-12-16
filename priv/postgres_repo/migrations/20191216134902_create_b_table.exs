defmodule PhoenixExample.Repo.Migrations.CreateBTable do
  use Ecto.Migration

  def change do
    create table(:b_table) do
      add :name, :string
      add :age, :integer

      timestamps()
    end

  end
end
