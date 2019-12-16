defmodule PhoenixExample.BTableContextTest do
  use PhoenixExample.DataCase

  alias PhoenixExample.BTableContext

  describe "b_table" do
    alias PhoenixExample.BTableContext.BTable

    @valid_attrs %{age: 42, name: "some name"}
    @update_attrs %{age: 43, name: "some updated name"}
    @invalid_attrs %{age: nil, name: nil}

    def b_table_fixture(attrs \\ %{}) do
      {:ok, b_table} =
        attrs
        |> Enum.into(@valid_attrs)
        |> BTableContext.create_b_table()

      b_table
    end

    test "list_b_table/0 returns all b_table" do
      b_table = b_table_fixture()
      assert BTableContext.list_b_table() == [b_table]
    end

    test "get_b_table!/1 returns the b_table with given id" do
      b_table = b_table_fixture()
      assert BTableContext.get_b_table!(b_table.id) == b_table
    end

    test "create_b_table/1 with valid data creates a b_table" do
      assert {:ok, %BTable{} = b_table} = BTableContext.create_b_table(@valid_attrs)
      assert b_table.age == 42
      assert b_table.name == "some name"
    end

    test "create_b_table/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BTableContext.create_b_table(@invalid_attrs)
    end

    test "update_b_table/2 with valid data updates the b_table" do
      b_table = b_table_fixture()
      assert {:ok, %BTable{} = b_table} = BTableContext.update_b_table(b_table, @update_attrs)
      assert b_table.age == 43
      assert b_table.name == "some updated name"
    end

    test "update_b_table/2 with invalid data returns error changeset" do
      b_table = b_table_fixture()
      assert {:error, %Ecto.Changeset{}} = BTableContext.update_b_table(b_table, @invalid_attrs)
      assert b_table == BTableContext.get_b_table!(b_table.id)
    end

    test "delete_b_table/1 deletes the b_table" do
      b_table = b_table_fixture()
      assert {:ok, %BTable{}} = BTableContext.delete_b_table(b_table)
      assert_raise Ecto.NoResultsError, fn -> BTableContext.get_b_table!(b_table.id) end
    end

    test "change_b_table/1 returns a b_table changeset" do
      b_table = b_table_fixture()
      assert %Ecto.Changeset{} = BTableContext.change_b_table(b_table)
    end
  end
end
