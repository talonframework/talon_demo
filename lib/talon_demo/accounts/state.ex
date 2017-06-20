defmodule TalonDemo.Accounts.State do
  use Ecto.Schema
  import Ecto.Changeset
  alias TalonDemo.Accounts.State


  schema "states" do
    field :code, :string
    field :name, :string
    belongs_to :country, TalonDemo.Accounts.Country
    has_many :users, TalonDemo.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%State{} = state, attrs) do
    state
    |> cast(attrs, [:name, :code, :country_id])
    |> validate_required([:name, :code])
  end
end
