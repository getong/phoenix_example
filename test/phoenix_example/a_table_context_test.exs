defmodule PhoenixExample.ATableContextTest do
  use PhoenixExample.DataCase

  alias PhoenixExample.ATableContext

  describe "a_table" do
    alias PhoenixExample.ATableContext.ATable

    @valid_attrs %{name: "some name", password: "some password"}
    @update_attrs %{name: "some updated name", password: "some updated password"}
    @invalid_attrs %{name: nil, password: nil}

    def a_table_fixture(attrs \\ %{}) do
      {:ok, a_table} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ATableContext.create_a_table()

      a_table
    end

    test "list_a_table/0 returns all a_table" do
      a_table = a_table_fixture()
      assert ATableContext.list_a_table() == [a_table]
    end

    test "get_a_table!/1 returns the a_table with given id" do
      a_table = a_table_fixture()
      assert ATableContext.get_a_table!(a_table.id) == a_table
    end

    test "create_a_table/1 with valid data creates a a_table" do
      assert {:ok, %ATable{} = a_table} = ATableContext.create_a_table(@valid_attrs)
      assert a_table.name == "some name"
      assert a_table.password == "some password"
    end

    test "create_a_table/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ATableContext.create_a_table(@invalid_attrs)
    end

    test "update_a_table/2 with valid data updates the a_table" do
      a_table = a_table_fixture()
      assert {:ok, %ATable{} = a_table} = ATableContext.update_a_table(a_table, @update_attrs)
      assert a_table.name == "some updated name"
      assert a_table.password == "some updated password"
    end

    test "update_a_table/2 with invalid data returns error changeset" do
      a_table = a_table_fixture()
      assert {:error, %Ecto.Changeset{}} = ATableContext.update_a_table(a_table, @invalid_attrs)
      assert a_table == ATableContext.get_a_table!(a_table.id)
    end

    test "delete_a_table/1 deletes the a_table" do
      a_table = a_table_fixture()
      assert {:ok, %ATable{}} = ATableContext.delete_a_table(a_table)
      assert_raise Ecto.NoResultsError, fn -> ATableContext.get_a_table!(a_table.id) end
    end

    test "change_a_table/1 returns a a_table changeset" do
      a_table = a_table_fixture()
      assert %Ecto.Changeset{} = ATableContext.change_a_table(a_table)
    end
  end
end
