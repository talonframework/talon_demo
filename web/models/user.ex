defmodule NewAdmin.User do
  use NewAdmin.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :user_name, :string
    field :street_num, :string
    field :street, :string
    field :city, :string
    field :zip_code, :string
    field :active, :boolean, default: true
    field :birthdate, :date
    field :height, :integer
    belongs_to :state, NewAdmin.State, foreign_key: :state_id
    belongs_to :country, NewAdmin.Country, foreign_key: :country_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :user_name, :email, :street_num, :street, :city, :zip_code, :active, :birthdate, :height, :state_id, :country_id])
    |> validate_required([:name, :user_name, :email, :active])

  end

  def search_fields, do: [:name, :email, :street]
end
