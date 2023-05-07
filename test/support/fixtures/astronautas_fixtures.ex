defmodule SpacePhoenix.AstronautasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SpacePhoenix.Astronautas` context.
  """

  @doc """
  Generate a astronauta.
  """
  def astronauta_fixture(attrs \\ %{}) do
    {:ok, astronauta} =
      attrs
      |> Enum.into(%{
        apellido: "some apellido",
        fecha_nac: ~D[2023-05-05],
        lanzamientos: 42,
        nombre: "some nombre",
        num_id: 42
      })
      |> SpacePhoenix.Astronautas.create_astronauta()

    astronauta
  end
end
