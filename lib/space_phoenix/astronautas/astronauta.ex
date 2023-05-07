defmodule SpacePhoenix.Astronautas.Astronauta do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "astronautas" do
    field :apellido, :string
    field :fecha_nac, :date
    field :lanzamientos, :integer
    field :nombre, :string
    field :num_id, :integer
    field :cohete_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(astronauta, attrs) do
    astronauta
    |> cast(attrs, [:num_id, :nombre, :apellido, :fecha_nac, :lanzamientos])
    |> validate_required([:num_id, :nombre, :apellido, :fecha_nac, :lanzamientos])
  end
end
