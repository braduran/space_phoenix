defmodule SpacePhoenix.Repo.Migrations.CreateAstronautas do
  use Ecto.Migration

  def change do
    create table(:astronautas, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :num_id, :integer
      add :nombre, :string
      add :apellido, :string
      add :fecha_nac, :date
      add :lanzamientos, :integer
      add :cohete_id, references(:cohetes, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:astronautas, [:cohete_id])
  end
end
