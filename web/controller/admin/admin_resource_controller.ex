defmodule NewAdmin.AdminResourceController do
  use NewAdmin.Web, :controller
  use ExAdmin.Controller, repo: NewAdmin.Repo, admin: NewAdmin.Admin

  plug ExAdmin.Plug.AdminResource
  plug ExAdmin.Plug.LoadResource
  plug ExAdmin.Plug.LoadAssociations
  plug ExAdmin.Plug.LoadAssociatedCollections when action in [:new, :edit]
  plug ExAdmin.Plug.Theme
  plug ExAdmin.Plug.Layout
  plug ExAdmin.Plug.View

end
