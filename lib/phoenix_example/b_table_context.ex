defmodule PhoenixExample.BTableContext do
  @moduledoc """
  The BTableContext context.
  """

  # import Ecto.Query, warn: false
  alias PhoenixExample.PostgresRepo

  alias PhoenixExample.BTableContext.BTable

  @doc """
  Returns the list of b_table.

  ## Examples

      iex> list_b_table()
      [%BTable{}, ...]

  """
  def list_b_table do
    PostgresRepo.all(BTable)
  end

  @doc """
  Gets a single b_table.

  Raises `Ecto.NoResultsError` if the B table does not exist.

  ## Examples

      iex> get_b_table!(123)
      %BTable{}

      iex> get_b_table!(456)
      ** (Ecto.NoResultsError)

  """
  def get_b_table!(id), do: PostgresRepo.get!(BTable, id)

  @doc """
  Creates a b_table.

  ## Examples

      iex> create_b_table(%{field: value})
      {:ok, %BTable{}}

      iex> create_b_table(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_b_table(attrs \\ %{}) do
    %BTable{}
    |> BTable.changeset(attrs)
    |> PostgresRepo.insert()
  end

  @doc """
  Updates a b_table.

  ## Examples

      iex> update_b_table(b_table, %{field: new_value})
      {:ok, %BTable{}}

      iex> update_b_table(b_table, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_b_table(%BTable{} = b_table, attrs) do
    b_table
    |> BTable.changeset(attrs)
    |> PostgresRepo.update()
  end

  @doc """
  Deletes a BTable.

  ## Examples

      iex> delete_b_table(b_table)
      {:ok, %BTable{}}

      iex> delete_b_table(b_table)
      {:error, %Ecto.Changeset{}}

  """
  def delete_b_table(%BTable{} = b_table) do
    PostgresRepo.delete(b_table)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking b_table changes.

  ## Examples

      iex> change_b_table(b_table)
      %Ecto.Changeset{source: %BTable{}}

  """
  def change_b_table(%BTable{} = b_table) do
    BTable.changeset(b_table, %{})
  end
end
