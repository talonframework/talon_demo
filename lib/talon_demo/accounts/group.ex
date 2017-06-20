defmodule TalonDemo.Accounts.Group do
  use Ecto.Schema
  import Ecto.Changeset
  alias TalonDemo.Accounts.Group


  schema "groups" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Group{} = group, attrs) do
    group
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
