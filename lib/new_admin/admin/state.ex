defmodule NewAdmin.ExAdmin.State do
  use ExAdmin.Resource, schema: NewAdmin.State
  use ExAdmin.Controller, :resource

  def preload(resource, _) do
    NewAdmin.Repo.preload resource, [:country]
  end
end