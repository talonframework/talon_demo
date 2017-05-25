defmodule AdminLte.DatatableView do
  use Phoenix.View, root: "web/templates/admin/admin_lte/components"
  use ExAdmin.Web, :view
  use ExAdmin.Components.Datatable, __MODULE__


end