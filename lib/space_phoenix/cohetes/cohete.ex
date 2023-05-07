defmodule SpacePhoenix.Cohetes.Cohete do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "cohetes" do
    field :altura, :string
    field :capacidad, :integer
    field :fecha_lanzamiento, :date
    field :marca, :string
    field :num_ref, :string
    field :peso, :string

    timestamps()
  end

  @doc false
  def changeset(cohete, attrs) do
    cohete
    |> cast(attrs, [:num_ref, :marca, :peso, :altura, :capacidad, :fecha_lanzamiento])
    |> validate_required([:num_ref, :marca, :peso, :altura, :capacidad, :fecha_lanzamiento])
  end
end
