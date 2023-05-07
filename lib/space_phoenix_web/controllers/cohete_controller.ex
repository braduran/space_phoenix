defmodule SpacePhoenixWeb.CoheteController do
  use SpacePhoenixWeb, :controller

  alias SpacePhoenix.Cohetes
  alias SpacePhoenix.Cohetes.Cohete

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
end
