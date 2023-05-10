defmodule SpacePhoenixWeb.AstronautaController do
  use SpacePhoenixWeb, :controller

  alias SpacePhoenix.Astronautas
  alias SpacePhoenix.Astronautas.Astronauta

  action_fallback SpacePhoenixWeb.FallbackController

  def index(conn, _params) do
    astronautas = Astronautas.list_astronautas()
    render(conn, :index, astronautas: astronautas)
  end

  def create(conn, %{"astronauta" => astronauta_params}) do
    with {:ok, %Astronauta{} = astronauta} <- Astronautas.create_astronauta(astronauta_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/astronautas/#{astronauta}")
      |> render(:show, astronauta: astronauta)
    end
  end

  def show(conn, %{"id" => id}) do
    astronauta = Astronautas.get_astronauta!(id)
    render(conn, :show, astronauta: astronauta)
  end

  def update(conn, %{"id" => id, "astronauta" => astronauta_params}) do
    astronauta = Astronautas.get_astronauta!(id)

    with {:ok, %Astronauta{} = astronauta} <- Astronautas.update_astronauta(astronauta, astronauta_params) do
      render(conn, :show, astronauta: astronauta)
    end
  end

  def delete(conn, %{"id" => id}) do
    astronauta = Astronautas.get_astronauta!(id)

    with {:ok, %Astronauta{}} <- Astronautas.delete_astronauta(astronauta) do
      send_resp(conn, :no_content, "")
    end
  end

  def query_greater_equal_launch(conn, %{"launch" => launch}) do
    astronautas = Astronautas.query_greater_equal_launch_astronautas(String.to_integer(launch))
    render(conn, :index, astronautas: astronautas)
  end
end
