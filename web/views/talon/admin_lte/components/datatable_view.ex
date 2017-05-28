defmodule AdminLte.DatatableView do
  use Talon.Web, which: :component_view, theme: "admin_lte", module: AdminLte
  use Talon.Components.Datatable, __MODULE__

end
