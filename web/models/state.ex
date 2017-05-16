defmodule NewAdmin.State do
  use NewAdmin.Web, :model

  schema "states" do
    field :name, :string
    field :code, :string
    belongs_to :country, NewAdmin.Country, foreign_key: :country_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :code, :country_id])
    |> validate_required([:name, :code, :country_id])
  end
end
