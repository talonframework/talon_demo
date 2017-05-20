defmodule ExAdmin.AdminResourceController do
  use NewAdmin.Web, :controller
  use ExAdmin.Controller, repo: NewAdmin.Repo, admin: NewAdmin.Admin

  plug ExAdmin.Plug.AdminResource
  plug ExAdmin.Plug.LoadResource
  plug ExAdmin.Plug.LoadAssociations
  plug ExAdmin.Plug.LoadAssociatedCollections when action in [:new, :edit]
  plug ExAdmin.Plug.Theme
  plug ExAdmin.Plug.Layout
  plug ExAdmin.Plug.View

  require Logger

  def index(conn, _) do
    IO.inspect conn.assigns.ex_admin, label: "ex_admin: "
    IO.inspect conn.private, label: "private: "
    render conn, "index.html"
  end

  def edit(conn, params) do
    IO.puts "edit.. ex_admin: #{inspect conn.assigns.ex_admin}"
    super(conn, params)
  end

  # this is a place holder to test the view layer. This will be replaced with a controller
  # solution that I have not looked at yet. 
  # def index(conn, %{"resource" => resource_name}) do
  #   # {resource_name, resource_module} = res = NewAdmin.Admin.resource_schema(resource_name)
  #   # schema = resource_module.schema()
  #   {schema, resource_name, theme} = 
  #     NewAdmin.Admin.controller_action(resource_name)
  #   # theme = Application.get_env :ex_admin, :theme
  #   resources = Repo.all(schema)
  #   conn
  #   |> put_layout({NewAdmin.LayoutView, "app.html"})
  #   |> put_view(get_view(resource_name))
  #   |> render("index.html", [resources: resources, resource: schema.__struct__])
  # end 

  # def new(conn, %{"resource" => resource_name}) do
  #   {resource_name, resource_module} = res = NewAdmin.Admin.resource_schema(resource_name)
  #   schema = resource_module.schema()
  #   theme = Application.get_env :ex_admin, :theme
  #   resource = 
  #     schema.__struct__
  #     |> resource_module.preload(:new)
  #   changeset = schema.changeset(resource)
  #   conn
  #   |> put_layout({NewAdmin.LayoutView, "app.html"})
  #   |> put_view(get_view(resource_name))
  #   |> render("new.html", [resource: resource, changeset: changeset])
  # end

  # def edit(conn, %{"resource" => resource_name, "id" => id}) do
  #   {resource_name, resource_module} = res = NewAdmin.Admin.resource_schema(resource_name)
  #   schema = resource_module.schema()
  #   theme = Application.get_env :ex_admin, :theme
  #   resource = 
  #     Repo.get(schema, id) # |> Enum.take(1)
  #     |> resource_module.preload(:edit)
  #   changeset = schema.changeset(resource)
  #   conn
  #   |> put_layout({NewAdmin.LayoutView, "app.html"})
  #   |> put_view(get_view(resource_name))
  #   |> render("edit.html", [resource: resource, changeset: changeset])
  # end

  # def create(conn, %{"resource" => resource_name} = params) do
  #   {schema, resource_name, theme} = 
  #     NewAdmin.Admin.controller_action(resource_name)

  #   resource = schema.__struct__
  #   changeset = schema.changeset(resource, params[resource_name])
  #   case Repo.insert(changeset) do
  #     {:ok, resource} ->
  #       conn
  #       |> put_flash(:notice, "#{inspect schema} created successfully.")
  #       |> redirect(to: ExAdmin.Utils.admin_association_path(resource, :show))
  #     {:error, changeset} -> 
  #       conn
  #       |> put_layout({NewAdmin.LayoutView, "app.html"})
  #       |> put_view(get_view(resource_name))
  #       |> render("new.html", [resource: resource, changeset: changeset])
  #   end
  # end

  # def update(conn, %{"resource" => resource_name} = params) do
  #   {schema, resource_name, theme} = 
  #     NewAdmin.Admin.controller_action(resource_name)
  #   resource_params = params[resource_name]
  #   # TODO: need to lookup the primary key below
  #   resource = Repo.get(schema, resource_params["id"])
  #   changeset = schema.changeset(resource, resource_params)
  #   case Repo.update changeset do
  #     {:ok, resource} -> 
  #       conn
  #       |> put_flash(:notice, "#{inspect schema} updated successfully")
  #       |> redirect(to: ExAdmin.Utils.admin_association_path(resource.__struct__, :index))
  #     {:error, changeset} -> 
  #       conn
  #       |> put_layout({NewAdmin.LayoutView, "app.html"})
  #       |> put_view(get_view(resource_name))
  #       |> render("edit.html", [resource: resource, changeset: changeset])
  #    end
  # end

  # def delete(conn, %{"resource" => resource_name, "id" => id}) do
  #   {schema, resource_name, theme} = 
  #     NewAdmin.Admin.controller_action(resource_name)

  #   resource = Repo.get(schema, id) # |> Enum.take(1)
  #   Repo.delete! resource
  #   conn
  #   |> put_flash(:notice, "#{inspect schema} deleted successfully")
  #   |> redirect(to: ExAdmin.Utils.admin_association_path(resource.__struct__, :index))
  # end

  # def get_view(resource_name) do
  #   Module.concat ExAdmin, String.capitalize(to_string resource_name) <> "View"
  # end
end