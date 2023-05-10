defmodule SpacePhoenixWeb.AstronautaJSON do
  alias SpacePhoenix.Astronautas.Astronauta

  @doc """
  Renders a list of astronautas.
  """
  def index(%{astronautas: astronautas}) do
    %{data: for(astronauta <- astronautas, do: data(astronauta))}
  end

  @doc """
  Renders a single astronauta.
  """
  def show(%{astronauta: astronauta}) do
    %{data: data(astronauta)}
  end

  defp data(%Astronauta{} = astronauta) do
    %{
      id: astronauta.id,
      num_id: astronauta.num_id,
      nombre: astronauta.nombre,
      apellido: astronauta.apellido,
      fecha_nac: astronauta.fecha_nac,
      lanzamientos: astronauta.lanzamientos,
      cohete_id: astronauta.cohete_id
    }
  end
end
