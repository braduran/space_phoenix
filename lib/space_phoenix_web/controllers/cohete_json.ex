defmodule SpacePhoenixWeb.CoheteJSON do
  alias SpacePhoenix.Cohetes.Cohete

  @doc """
  Renders a list of cohetes.
  """
  def index(%{cohetes: cohetes}) do
    %{data: for(cohete <- cohetes, do: data(cohete))}
  end

  @doc """
  Renders a single cohete.
  """
  def show(%{cohete: cohete}) do
    %{data: data(cohete)}
  end

  defp data(%Cohete{} = cohete) do
    %{
      id: cohete.id,
      num_ref: cohete.num_ref,
      marca: cohete.marca,
      peso: cohete.peso,
      altura: cohete.altura,
      capacidad: cohete.capacidad,
      fecha_lanzamiento: cohete.fecha_lanzamiento
    }
  end
end
