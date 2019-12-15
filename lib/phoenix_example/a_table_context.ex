defmodule PhoenixExample.ATableContext do
  @moduledoc """
  The ATableContext context.
  """

  # import Ecto.Query, warn: false
  alias PhoenixExample.MysqlRepo

  alias PhoenixExample.ATableContext.ATable

  @doc """
  Returns the list of a_table.

  ## Examples

      iex> list_a_table()
      [%ATable{}, ...]

  """
  def list_a_table do
    MysqlRepo.all(ATable)
  end

  @doc """
  Gets a single a_table.

  Raises `Ecto.NoResultsError` if the A table does not exist.

  ## Examples

      iex> get_a_table!(123)
      %ATable{}

      iex> get_a_table!(456)
      ** (Ecto.NoResultsError)

  """
  def get_a_table!(id), do: MysqlRepo.get!(ATable, id)

  @doc """
  Creates a a_table.

  ## Examples

      iex> create_a_table(%{field: value})
      {:ok, %ATable{}}

      iex> create_a_table(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_a_table(attrs \\ %{}) do
    %ATable{}
    |> ATable.changeset(attrs)
    |> MysqlRepo.insert()
  end

  @doc """
  Updates a a_table.

  ## Examples

      iex> update_a_table(a_table, %{field: new_value})
      {:ok, %ATable{}}

      iex> update_a_table(a_table, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_a_table(%ATable{} = a_table, attrs) do
    a_table
    |> ATable.changeset(attrs)
    |> MysqlRepo.update()
  end

  @doc """
  Deletes a ATable.

  ## Examples

      iex> delete_a_table(a_table)
      {:ok, %ATable{}}

      iex> delete_a_table(a_table)
      {:error, %Ecto.Changeset{}}

  """
  def delete_a_table(%ATable{} = a_table) do
    MysqlRepo.delete(a_table)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking a_table changes.

  ## Examples

      iex> change_a_table(a_table)
      %Ecto.Changeset{source: %ATable{}}

  """
  def change_a_table(%ATable{} = a_table) do
    ATable.changeset(a_table, %{})
  end
end
