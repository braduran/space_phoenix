defmodule SpacePhoenix.Repo.Migrations.CreateCohetes do
  use Ecto.Migration

  def change do
    create table(:cohetes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :num_ref, :string
      add :marca, :string
      add :peso, :string
      add :altura, :string
      add :capacidad, :integer
      add :fecha_lanzamiento, :date

      timestamps()
    end
  end
end
