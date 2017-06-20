defmodule TalonDemo.Repo.Migrations.CreateTalonDemo.Accounts.Country do
  use Ecto.Migration

  def change do
    create table(:countries) do
      add :name, :string
      add :code, :string

      timestamps()
    end

  end
end
