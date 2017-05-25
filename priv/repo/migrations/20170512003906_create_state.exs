defmodule TalonDemo.Repo.Migrations.CreateState do
  use Ecto.Migration

  def change do
    create table(:states) do
      add :name, :string
      add :code, :string
      add :country_id, references(:countries, on_delete: :nothing)

      timestamps()
    end

    create index(:states, [:country_id])
  end
end

