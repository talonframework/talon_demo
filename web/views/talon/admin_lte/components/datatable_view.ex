defmodule AdminLte.DatatableView do
  use Phoenix.View, root: "web/templates/talon/admin_lte/components"
  use Talon.Web, :view
  use Talon.Components.Datatable, __MODULE__


end
