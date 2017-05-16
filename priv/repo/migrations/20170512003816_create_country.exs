defmodule NewAdmin.Repo.Migrations.CreateCountry do
  use Ecto.Migration

  def change do
    create table(:countries) do
      add :name, :string
      add :code, :string

      timestamps()
    end

  end
end

