defmodule ExAdmin.DatatableView do
  use Phoenix.View, root: "web/templates/admin/admin_lte/components"
  use ExAdmin.Web, :view
  use ExAdmin.Datatable, __MODULE__


  def render("search.html", opts) do
    render("table_body.html", opts)
    |> Phoenix.HTML.safe_to_string
    |> Phoenix.HTML.raw
  end
end