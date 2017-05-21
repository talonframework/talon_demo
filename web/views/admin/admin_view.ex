defmodule ExAdmin.AdminView do
  use Phoenix.View, root: "web/templates/admin/material_bootstrap"
  use ExAdmin.Web, :view

  theme = Application.get_env :ex_admin, :theme, "default"

  for {resource_name, resource_module} <- NewAdmin.Admin.resource_map() do
    resource_name = NewAdmin.Admin.template_path_name resource_name

    for action <- [:index, :edit, :form, :new, :show] do
      templ = EEx.eval_file("web/templates/admin/#{theme}/generators/#{action}.html.eex", assigns: [resource_module: resource_module])
      File.mkdir_p("web/templates/admin/#{theme}/#{resource_name}")
      File.write("web/templates/admin/#{theme}/#{resource_name}/#{action}.html.slim", templ)
    end
  end
end

for resource <- NewAdmin.Admin.schema_names() do
  mod = Module.concat ExAdmin, resource <> "View"
  defmodule mod do
    theme = Application.get_env :ex_admin, :theme, "default"
    use Phoenix.View, root: "web/templates/admin/#{theme}"
    use ExAdmin.Web, :view
  end
end