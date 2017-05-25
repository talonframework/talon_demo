defmodule TalonDemo.Repo.Migrations.CreateGroup do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :name, :string
      add :description, :text

      timestamps()
    end

  end
end

