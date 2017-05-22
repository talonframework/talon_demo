defmodule NewAdmin.ExAdmin.State do
  use ExAdmin.Resource, schema: NewAdmin.State
  use ExAdmin.Controller, :resource

  @doc """
  Prelod the :state and :country associations
  """
  def preload(resource, _action) do
    NewAdmin.Repo.preload resource, [:country]
  end

  @doc """
  Override the default index columns
  Add the :id column on the index page and add the
  :id, :updated_at and :inserted_at fields for the
  show page. Use the default for the form page.
  """
  def display_schema_columns(:index) do
    [:id | super(:index)]
  end
  def display_schema_columns(:show) do
    [:id | super(:showw)] ++ [:updated_at, :inserted_at]
  end
  def display_schema_columns(action) do
    super(action)
  end


end