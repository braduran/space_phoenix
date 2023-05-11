defmodule SpacePhoenixWeb.CoheteController do
  use SpacePhoenixWeb, :controller

  alias SpacePhoenix.Cohetes
  alias SpacePhoenix.Cohetes.Cohete
  alias SpacePhoenix.Astronautas
  alias SpacePhoenix.Astronautas.Astronauta

  action_fallback SpacePhoenixWeb.FallbackController

  def index(conn, _params) do
    cohetes = Cohetes.list_cohetes()
    render(conn, :index, cohetes: cohetes)
  end

  def create(conn, %{"cohete" => cohete_params}) do
    with {:ok, %Cohete{} = cohete} <- Cohetes.create_cohete(cohete_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/cohetes/#{cohete}")
      |> render(:show, cohete: cohete)
    end
  end

  def show(conn, %{"id" => id}) do
    cohete = Cohetes.get_cohete!(id)
    render(conn, :show, cohete: cohete)
  end

  def update(conn, %{"id" => id, "cohete" => cohete_params}) do
    cohete = Cohetes.get_cohete!(id)

    with {:ok, %Cohete{} = cohete} <- Cohetes.update_cohete(cohete, cohete_params) do
      render(conn, :show, cohete: cohete)
    end
  end

  def delete(conn, %{"id" => id}) do
    cohete = Cohetes.get_cohete!(id)

    with {:ok, %Cohete{}} <- Cohetes.delete_cohete(cohete) do
      send_resp(conn, :no_content, "")
    end
  end

  def create_all(conn, %{"cohete" => cohete_params}) do
    {cohete, astronautas} = separate_cohete_request(cohete_params)
    {:ok, %Cohete{} = cohete_created} = Cohetes.create_cohete(cohete)

    save_astronauta(astronautas, cohete_created.id)
    render(conn, :show_cohete_id, cohete_id: cohete_created.id)
  end

  def quey_like_brand(conn, %{"cohete_brand" => cohete_brand}) do
    cohetes = Cohetes.query_like_brand_cohetes(cohete_brand)
    render(conn, :index, cohetes: cohetes)
  end

  def save_astronauta(astronauta, _) when astronauta == [] do
    "Guardar Astronautas finalizado"
  end

  def save_astronauta(astronautas, cohete_id) do
      first_a = List.first(astronautas)
      build_astronauta(first_a, cohete_id) |> Astronautas.create_astronauta
      update_a = List.delete(astronautas, first_a)
      save_astronauta(update_a, cohete_id)
  end

  def separate_cohete_request(cohete_params) do
    cohete_map = %{
                    num_ref: cohete_params["num_ref"],
                    marca: cohete_params["marca"],
                    peso: cohete_params["peso"],
                    altura: cohete_params["altura"],
                    capacidad: cohete_params["capacidad"],
                    fecha_lanzamiento: cohete_params["fecha_lanzamiento"]
                  }
    {cohete_map, cohete_params["astronautas"]}
  end

  def build_astronauta(astronauta, cohete_save_id) do
    %{
      num_id: astronauta["num_id"],
      nombre: astronauta["nombre"],
      apellido: astronauta["apellido"],
      fecha_nac: astronauta["fecha_nac"],
      lanzamientos: astronauta["lanzamientos"],
      cohete_id: cohete_save_id
    }
  end
end
