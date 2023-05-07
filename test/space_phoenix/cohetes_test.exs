defmodule SpacePhoenix.CohetesTest do
  use SpacePhoenix.DataCase

  alias SpacePhoenix.Cohetes

  describe "cohetes" do
    alias SpacePhoenix.Cohetes.Cohete

    import SpacePhoenix.CohetesFixtures

    @invalid_attrs %{altura: nil, capacidad: nil, fecha_lanzamiento: nil, marca: nil, num_ref: nil, peso: nil}

    test "list_cohetes/0 returns all cohetes" do
      cohete = cohete_fixture()
      assert Cohetes.list_cohetes() == [cohete]
    end

    test "get_cohete!/1 returns the cohete with given id" do
      cohete = cohete_fixture()
      assert Cohetes.get_cohete!(cohete.id) == cohete
    end

    test "create_cohete/1 with valid data creates a cohete" do
      valid_attrs = %{altura: "some altura", capacidad: 42, fecha_lanzamiento: ~D[2023-05-05], marca: "some marca", num_ref: "some num_ref", peso: "some peso"}

      assert {:ok, %Cohete{} = cohete} = Cohetes.create_cohete(valid_attrs)
      assert cohete.altura == "some altura"
      assert cohete.capacidad == 42
      assert cohete.fecha_lanzamiento == ~D[2023-05-05]
      assert cohete.marca == "some marca"
      assert cohete.num_ref == "some num_ref"
      assert cohete.peso == "some peso"
    end

    test "create_cohete/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cohetes.create_cohete(@invalid_attrs)
    end

    test "update_cohete/2 with valid data updates the cohete" do
      cohete = cohete_fixture()
      update_attrs = %{altura: "some updated altura", capacidad: 43, fecha_lanzamiento: ~D[2023-05-06], marca: "some updated marca", num_ref: "some updated num_ref", peso: "some updated peso"}

      assert {:ok, %Cohete{} = cohete} = Cohetes.update_cohete(cohete, update_attrs)
      assert cohete.altura == "some updated altura"
      assert cohete.capacidad == 43
      assert cohete.fecha_lanzamiento == ~D[2023-05-06]
      assert cohete.marca == "some updated marca"
      assert cohete.num_ref == "some updated num_ref"
      assert cohete.peso == "some updated peso"
    end

    test "update_cohete/2 with invalid data returns error changeset" do
      cohete = cohete_fixture()
      assert {:error, %Ecto.Changeset{}} = Cohetes.update_cohete(cohete, @invalid_attrs)
      assert cohete == Cohetes.get_cohete!(cohete.id)
    end

    test "delete_cohete/1 deletes the cohete" do
      cohete = cohete_fixture()
      assert {:ok, %Cohete{}} = Cohetes.delete_cohete(cohete)
      assert_raise Ecto.NoResultsError, fn -> Cohetes.get_cohete!(cohete.id) end
    end

    test "change_cohete/1 returns a cohete changeset" do
      cohete = cohete_fixture()
      assert %Ecto.Changeset{} = Cohetes.change_cohete(cohete)
    end
  end
end
