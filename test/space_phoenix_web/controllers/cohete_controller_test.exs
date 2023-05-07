defmodule SpacePhoenixWeb.CoheteControllerTest do
  use SpacePhoenixWeb.ConnCase

  import SpacePhoenix.CohetesFixtures

  alias SpacePhoenix.Cohetes.Cohete

  @create_attrs %{
    altura: "some altura",
    capacidad: 42,
    fecha_lanzamiento: ~D[2023-05-05],
    marca: "some marca",
    num_ref: "some num_ref",
    peso: "some peso"
  }
  @update_attrs %{
    altura: "some updated altura",
    capacidad: 43,
    fecha_lanzamiento: ~D[2023-05-06],
    marca: "some updated marca",
    num_ref: "some updated num_ref",
    peso: "some updated peso"
  }
  @invalid_attrs %{altura: nil, capacidad: nil, fecha_lanzamiento: nil, marca: nil, num_ref: nil, peso: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all cohetes", %{conn: conn} do
      conn = get(conn, ~p"/api/cohetes")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create cohete" do
    test "renders cohete when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/cohetes", cohete: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/cohetes/#{id}")

      assert %{
               "id" => ^id,
               "altura" => "some altura",
               "capacidad" => 42,
               "fecha_lanzamiento" => "2023-05-05",
               "marca" => "some marca",
               "num_ref" => "some num_ref",
               "peso" => "some peso"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/cohetes", cohete: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update cohete" do
    setup [:create_cohete]

    test "renders cohete when data is valid", %{conn: conn, cohete: %Cohete{id: id} = cohete} do
      conn = put(conn, ~p"/api/cohetes/#{cohete}", cohete: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/cohetes/#{id}")

      assert %{
               "id" => ^id,
               "altura" => "some updated altura",
               "capacidad" => 43,
               "fecha_lanzamiento" => "2023-05-06",
               "marca" => "some updated marca",
               "num_ref" => "some updated num_ref",
               "peso" => "some updated peso"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, cohete: cohete} do
      conn = put(conn, ~p"/api/cohetes/#{cohete}", cohete: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete cohete" do
    setup [:create_cohete]

    test "deletes chosen cohete", %{conn: conn, cohete: cohete} do
      conn = delete(conn, ~p"/api/cohetes/#{cohete}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/cohetes/#{cohete}")
      end
    end
  end

  defp create_cohete(_) do
    cohete = cohete_fixture()
    %{cohete: cohete}
  end
end
