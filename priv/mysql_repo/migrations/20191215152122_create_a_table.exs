defmodule PhoenixExample.Repo.Migrations.CreateATable do
  use Ecto.Migration

  def change do
    create table(:a_table) do
      add :name, :string
      add :password, :string

      ## timestamps()
      ## use :utc_datetime_usec, see http://www.creativedeletion.com/2019/06/17/utc-timestamps-in-ecto.html
      timestamps(type: :utc_datetime_usec)
    end
  end
end
