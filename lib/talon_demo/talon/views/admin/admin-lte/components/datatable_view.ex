defmodule TalonDemo.Admin.AdminLte.Web.DatatableView do
  use TalonDemo.Talon.Web, which: :component_view, theme: "admin/admin-lte", module: TalonDemo.Admin.AdminLte.Web
  use Talon.Components.Datatable, __MODULE__

end
