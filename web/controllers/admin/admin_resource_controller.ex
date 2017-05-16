defmodule ExAdmin.AdminResourceController do
  use ExAdmin.Web, :controller
  require Logger

  # this is a place holder to test the view layer. This will be replaced with a controller
  # solution that I have not looked at yet. 
  def index(conn, %{"resource" => resource_name}) do
    {resource_name, resource_module} = res = NewAdmin.Admin.resource_schema(resource_name)
    schema = resource_module.schema()
    theme = Application.get_env :ex_admin, :theme
    resources = Repo.all(schema) # |> Enum.take(1)
    conn
    |> put_layout({NewAdmin.LayoutView, "app.html"})
    |> put_view(get_view(resource_name))
    |> render("index.html", [resources: resources, resource: schema.__struct__])
  end 

  def get_view(resource_name) do
    Module.concat ExAdmin, String.capitalize(to_string resource_name) <> "View"
  end
end