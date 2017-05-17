defmodule ExAdmin.AdminView do
  use Phoenix.View, root: "web/templates/admin/material_bootstrap"
  use ExAdmin.Web, :view

  theme = Application.get_env :ex_admin, :theme, "default"

  IO.puts "starting compile"
  for {resource_name, resource_module} <- NewAdmin.Admin.resource_map() do
    # schema_meta = Application.get_env(:ex_admin, schema, [])
    # index_meta = Keyword.get(schema_meta, :index, [])
    # module = Module.split(schema) |> List.last |> to_string
    # admin = 
    #   [module: module]
    #   |> Keyword.merge(index_meta)
    IO.puts ".... resource_name: #{inspect resource_name}, resource_module: #{inspect resource_module}"
    for action <- [:index, :edit, :form, :new] do
      IO.puts "doing action: #{inspect action}"
      templ = EEx.eval_file("web/templates/admin/#{theme}/generators/#{action}.html.eex", assigns: [resource_module: resource_module])
      File.mkdir_p("web/templates/admin/#{theme}/#{resource_name}")
      File.write("web/templates/admin/#{theme}/#{resource_name}/#{action}.html.slim", templ) 
    end
  end


  # def render(path, bindings) do
  #   IO.puts "path: #{inspect path}"
  #   # "web/templates/admin/" <> path <> ".slim"
  #   # |> File.read!
  #   # |> Slime.render(bindings)
  #   ExAdmin.MaterialBootstrap.Templates.render(path, bindings) 
  # end

end
IO.puts "..."
# IO.inspect Application.get_env(:ex_admin, :resources, [])
# IO.inspect Application.get_env(:ex_admin, :resources, []) |> Keyword.keys
for resource <- NewAdmin.Admin.resource_names() do
  IO.puts "resource: #{inspect resource}"
  mod = Module.concat ExAdmin, String.capitalize(to_string(resource)) <> "View"
  defmodule mod do
    theme = Application.get_env :ex_admin, :theme, "default"
    use Phoenix.View, root: "web/templates/admin/#{theme}"
    use ExAdmin.Web, :view
  end
end