defmodule SpacePhoenix.Astronautas do
  @moduledoc """
  The Astronautas context.
  """

  import Ecto.Query, warn: false
  alias SpacePhoenix.Repo

  alias SpacePhoenix.Astronautas.Astronauta

  @doc """
  Returns the list of astronautas.

  ## Examples

      iex> list_astronautas()
      [%Astronauta{}, ...]

  """
  def list_astronautas do
    Repo.all(Astronauta)
  end

  @doc """
  Gets a single astronauta.

  Raises `Ecto.NoResultsError` if the Astronauta does not exist.

  ## Examples

      iex> get_astronauta!(123)
      %Astronauta{}

      iex> get_astronauta!(456)
      ** (Ecto.NoResultsError)

  """
  def get_astronauta!(id), do: Repo.get!(Astronauta, id)

  @doc """
  Creates a astronauta.

  ## Examples

      iex> create_astronauta(%{field: value})
      {:ok, %Astronauta{}}

      iex> create_astronauta(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_astronauta(attrs \\ %{}) do
    %Astronauta{}
    |> Astronauta.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a astronauta.

  ## Examples

      iex> update_astronauta(astronauta, %{field: new_value})
      {:ok, %Astronauta{}}

      iex> update_astronauta(astronauta, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_astronauta(%Astronauta{} = astronauta, attrs) do
    astronauta
    |> Astronauta.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a astronauta.

  ## Examples

      iex> delete_astronauta(astronauta)
      {:ok, %Astronauta{}}

      iex> delete_astronauta(astronauta)
      {:error, %Ecto.Changeset{}}

  """
  def delete_astronauta(%Astronauta{} = astronauta) do
    Repo.delete(astronauta)
  end

  def query_greater_equal_launch_astronautas(num_launch) when is_integer(num_launch)  do
    query = from(a in Astronauta, where: a.lanzamientos >= ^num_launch)
    Repo.all(query)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking astronauta changes.

  ## Examples

      iex> change_astronauta(astronauta)
      %Ecto.Changeset{data: %Astronauta{}}

  """
  def change_astronauta(%Astronauta{} = astronauta, attrs \\ %{}) do
    Astronauta.changeset(astronauta, attrs)
  end
end
