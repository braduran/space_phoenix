defmodule SpacePhoenixWeb.AstronautaControllerTest do
  use SpacePhoenixWeb.ConnCase

  import SpacePhoenix.AstronautasFixtures

  alias SpacePhoenix.Astronautas.Astronauta

  @create_attrs %{
    apellido: "some apellido",
    fecha_nac: ~D[2023-05-05],
    lanzamientos: 42,
    nombre: "some nombre",
    num_id: 42
  }
  @update_attrs %{
    apellido: "some updated apellido",
    fecha_nac: ~D[2023-05-06],
    lanzamientos: 43,
    nombre: "some updated nombre",
    num_id: 43
  }
  @invalid_attrs %{apellido: nil, fecha_nac: nil, lanzamientos: nil, nombre: nil, num_id: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all astronautas", %{conn: conn} do
      conn = get(conn, ~p"/api/astronautas")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create astronauta" do
    test "renders astronauta when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/astronautas", astronauta: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/astronautas/#{id}")

      assert %{
               "id" => ^id,
               "apellido" => "some apellido",
               "fecha_nac" => "2023-05-05",
               "lanzamientos" => 42,
               "nombre" => "some nombre",
               "num_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/astronautas", astronauta: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update astronauta" do
    setup [:create_astronauta]

    test "renders astronauta when data is valid", %{conn: conn, astronauta: %Astronauta{id: id} = astronauta} do
      conn = put(conn, ~p"/api/astronautas/#{astronauta}", astronauta: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/astronautas/#{id}")

      assert %{
               "id" => ^id,
               "apellido" => "some updated apellido",
               "fecha_nac" => "2023-05-06",
               "lanzamientos" => 43,
               "nombre" => "some updated nombre",
               "num_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, astronauta: astronauta} do
      conn = put(conn, ~p"/api/astronautas/#{astronauta}", astronauta: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete astronauta" do
    setup [:create_astronauta]

    test "deletes chosen astronauta", %{conn: conn, astronauta: astronauta} do
      conn = delete(conn, ~p"/api/astronautas/#{astronauta}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/astronautas/#{astronauta}")
      end
    end
  end

  defp create_astronauta(_) do
    astronauta = astronauta_fixture()
    %{astronauta: astronauta}
  end
end
