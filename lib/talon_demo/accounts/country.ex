defmodule TalonDemo.Accounts.Country do
  use Ecto.Schema
  import Ecto.Changeset
  alias TalonDemo.Accounts.Country


  schema "countries" do
    field :code, :string
    field :name, :string
    has_many :users, TalonDemo.Accounts.User
    has_many :states, TalonDemo.Accounts.State

    timestamps()
  end

  @doc false
  def changeset(%Country{} = country, attrs) do
    country
    |> cast(attrs, [:name, :code])
    |> validate_required([:name, :code])
  end
end
