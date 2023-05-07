defmodule SpacePhoenix.CohetesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SpacePhoenix.Cohetes` context.
  """

  @doc """
  Generate a cohete.
  """
  def cohete_fixture(attrs \\ %{}) do
    {:ok, cohete} =
      attrs
      |> Enum.into(%{
        altura: "some altura",
        capacidad: 42,
        fecha_lanzamiento: ~D[2023-05-05],
        marca: "some marca",
        num_ref: "some num_ref",
        peso: "some peso"
      })
      |> SpacePhoenix.Cohetes.create_cohete()

    cohete
  end
end
