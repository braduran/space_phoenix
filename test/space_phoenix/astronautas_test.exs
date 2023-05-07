defmodule SpacePhoenix.AstronautasTest do
  use SpacePhoenix.DataCase

  alias SpacePhoenix.Astronautas

  describe "astronautas" do
    alias SpacePhoenix.Astronautas.Astronauta

    import SpacePhoenix.AstronautasFixtures

    @invalid_attrs %{apellido: nil, fecha_nac: nil, lanzamientos: nil, nombre: nil, num_id: nil}

    test "list_astronautas/0 returns all astronautas" do
      astronauta = astronauta_fixture()
      assert Astronautas.list_astronautas() == [astronauta]
    end

    test "get_astronauta!/1 returns the astronauta with given id" do
      astronauta = astronauta_fixture()
      assert Astronautas.get_astronauta!(astronauta.id) == astronauta
    end

    test "create_astronauta/1 with valid data creates a astronauta" do
      valid_attrs = %{apellido: "some apellido", fecha_nac: ~D[2023-05-05], lanzamientos: 42, nombre: "some nombre", num_id: 42}

      assert {:ok, %Astronauta{} = astronauta} = Astronautas.create_astronauta(valid_attrs)
      assert astronauta.apellido == "some apellido"
      assert astronauta.fecha_nac == ~D[2023-05-05]
      assert astronauta.lanzamientos == 42
      assert astronauta.nombre == "some nombre"
      assert astronauta.num_id == 42
    end

    test "create_astronauta/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Astronautas.create_astronauta(@invalid_attrs)
    end

    test "update_astronauta/2 with valid data updates the astronauta" do
      astronauta = astronauta_fixture()
      update_attrs = %{apellido: "some updated apellido", fecha_nac: ~D[2023-05-06], lanzamientos: 43, nombre: "some updated nombre", num_id: 43}

      assert {:ok, %Astronauta{} = astronauta} = Astronautas.update_astronauta(astronauta, update_attrs)
      assert astronauta.apellido == "some updated apellido"
      assert astronauta.fecha_nac == ~D[2023-05-06]
      assert astronauta.lanzamientos == 43
      assert astronauta.nombre == "some updated nombre"
      assert astronauta.num_id == 43
    end

    test "update_astronauta/2 with invalid data returns error changeset" do
      astronauta = astronauta_fixture()
      assert {:error, %Ecto.Changeset{}} = Astronautas.update_astronauta(astronauta, @invalid_attrs)
      assert astronauta == Astronautas.get_astronauta!(astronauta.id)
    end

    test "delete_astronauta/1 deletes the astronauta" do
      astronauta = astronauta_fixture()
      assert {:ok, %Astronauta{}} = Astronautas.delete_astronauta(astronauta)
      assert_raise Ecto.NoResultsError, fn -> Astronautas.get_astronauta!(astronauta.id) end
    end

    test "change_astronauta/1 returns a astronauta changeset" do
      astronauta = astronauta_fixture()
      assert %Ecto.Changeset{} = Astronautas.change_astronauta(astronauta)
    end
  end
end
