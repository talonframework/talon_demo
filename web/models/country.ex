defmodule TalonDemo.Country do
  use TalonDemo.Web, :model

  schema "countries" do
    field :name, :string
    field :code, :string
    has_many :states, TalonDemo.State
    has_many :users, TalonDemo.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :code])
    |> validate_required([:name, :code])
  end

  def select_all do
    all()
    |> Enum.map(& {String.to_atom(&1.name), &1.id})
  end
end
