defmodule NewAdmin.ExAdmin.User do
  use ExAdmin.Resource, schema: NewAdmin.User
  use ExAdmin.Controller, :resource

  alias NewAdmin.Repo

  @doc """
  Prelod the :state and :country associations
  """
  def preload(resource, _) do
    Repo.preload(resource, [:state, :country])
  end

  @doc """
  Override the default index columns

  The example below overrides the columns for the :index action
  and uses the faults for the :show and :form pages.
  """
  def display_schema_columns(:index) do
    super(:index) -- [:active, :birthdate, :height]
  end
  def display_schema_columns(action) do
    super(action)
  end


  @doc """
  Override the default columm nam redering.
  """
  def render_column_name(_page, :zip_code), do: "Zip"
  def render_column_name(_page, :street_num), do: "Num"
  def render_column_name(page, field) do
    # handle redering for the remaining fields
    super(page, field)
  end

end