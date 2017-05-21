defmodule NewAdmin.ExAdmin.User do
  use ExAdmin.Resource, schema: NewAdmin.User
  use ExAdmin.Controller, :resource

  alias NewAdmin.Repo

  def preload(resource, _) do
    IO.puts "preloading ... "
    Repo.preload(resource, [:state, :country])
  end

  def index_columns do
    [:id | super()] -- [:active, :birthdate, :height]
  end

end