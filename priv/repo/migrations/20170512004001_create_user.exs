defmodule NewAdmin.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :user_name, :string
      add :street_num, :string
      add :street, :string
      add :city, :string
      add :zip_code, :string
      add :active, :boolean, default: false, null: false
      add :birthdate, :date
      add :height, :integer
      add :state_id, references(:states, on_delete: :nothing)
      add :country_id, references(:countries, on_delete: :nothing)

      timestamps()
    end

    create index(:users, [:state_id])
    create index(:users, [:country_id])
  end
end

