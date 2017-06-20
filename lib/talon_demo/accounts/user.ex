defmodule TalonDemo.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias TalonDemo.Accounts.User


  schema "users" do
    field :active, :boolean, default: true
    field :birthdate, :date
    field :city, :string
    field :email, :string
    field :height, :integer
    field :name, :string
    field :street, :string
    field :street_num, :string
    field :user_name, :string
    field :zip_code, :string
    belongs_to :state, TalonDemo.Accounts.State
    belongs_to :country, TalonDemo.Accounts.Country

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email, :user_name, :street_num, :street, :city, :zip_code, :active, :birthdate, :height, :state_id, :country_id])
    |> validate_required([:name, :email, :user_name, :street_num, :street, :city, :zip_code, :active, :birthdate, :height])
  end
end
