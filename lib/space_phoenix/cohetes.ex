defmodule SpacePhoenix.Cohetes do
  @moduledoc """
  The Cohetes context.
  """

  import Ecto.Query, warn: false
  alias SpacePhoenix.Repo

  alias SpacePhoenix.Cohetes.Cohete

  @doc """
  Returns the list of cohetes.

  ## Examples

      iex> list_cohetes()
      [%Cohete{}, ...]

  """
  def list_cohetes do
    Repo.all(Cohete)
  end

  @doc """
  Gets a single cohete.

  Raises `Ecto.NoResultsError` if the Cohete does not exist.

  ## Examples

      iex> get_cohete!(123)
      %Cohete{}

      iex> get_cohete!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cohete!(id), do: Repo.get!(Cohete, id)

  @doc """
  Creates a cohete.

  ## Examples

      iex> create_cohete(%{field: value})
      {:ok, %Cohete{}}

      iex> create_cohete(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cohete(attrs \\ %{}) do
    %Cohete{}
    |> Cohete.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cohete.

  ## Examples

      iex> update_cohete(cohete, %{field: new_value})
      {:ok, %Cohete{}}

      iex> update_cohete(cohete, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cohete(%Cohete{} = cohete, attrs) do
    cohete
    |> Cohete.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a cohete.

  ## Examples

      iex> delete_cohete(cohete)
      {:ok, %Cohete{}}

      iex> delete_cohete(cohete)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cohete(%Cohete{} = cohete) do
    Repo.delete(cohete)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cohete changes.

  ## Examples

      iex> change_cohete(cohete)
      %Ecto.Changeset{data: %Cohete{}}

  """
  def change_cohete(%Cohete{} = cohete, attrs \\ %{}) do
    Cohete.changeset(cohete, attrs)
  end

  def query_like_brand_cohetes(cohete_brand)  do
    like_cohete = "%#{cohete_brand}%"
    from(c in Cohete, where: ilike(c.marca, ^like_cohete)) |> Repo.all
  end

end
