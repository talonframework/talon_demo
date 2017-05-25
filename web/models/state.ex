defmodule TalonDemo.State do
  use TalonDemo.Web, :model

  schema "states" do
    field :name, :string
    field :code, :string
    belongs_to :country, TalonDemo.Country, foreign_key: :country_id
    has_many :users, TalonDemo.User

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

  def search(query, search_term) do
    (from u in query,
    where: fragment("(to_tsvector(?) || to_tsvector(?)) @@ plainto_tsquery(?)", u.name, u.code, ^search_term)) #,
    # order_by: fragment("ts_rank(to_tsvector(?), plainto_tsquery(?)) DESC", u.name, ^search_term))
  end
end
