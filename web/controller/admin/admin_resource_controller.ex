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

  require IEx

  # def index(conn, params) do
  #   res = super(conn, params)
  #   IEx.pry
  #   res
  # end

  # def search(conn, params) do
  #   search_terms = params["search_terms"]
  #   admin_resource = ExAdmin.View.admin_resource(conn)
  #   repo = admin_resource.repo()
  #   resources =
  #     case admin_resource.search conn do
  #       nil -> []
  #       query -> repo.all(query)
  #     end
  #   IEx.pry
  #   conn
  #   |> put_layout(false)
  #   |> put_view(ExAdmin.DatatableView)
  #   |> render("search.html", resources: resources, conn: conn)
  # end
  def search(conn, params) do
    # IEx.pry
    conn
    |> put_layout(false)
    |> put_view(ExAdmin.DatatableView)
    |> render("search.html", conn: conn)
  end

  # Each of the controller actions can be overridden in this module

  # Override the show action
  # def show(conn, params) do
  #   IO.inspect params, label: params
  #   conn
  #   |> assign(:something, "something")
  #   |> super(paams)
  # end

end
