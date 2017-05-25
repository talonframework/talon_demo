defmodule AdminLte.PaginateView do
  use Phoenix.View, root: "web/templates/admin/admin_lte/components"
  use ExAdmin.Web, :view

  import ExAdmin.Components.Paginate
  import ExAdmin.Utils, only: [to_integer: 1]

  def paginate(%{params: params} = conn) do
    page_number = to_integer(params["page"] || 1)
    page = conn.assigns[:page]
    model_name =
      conn.assigns[:resource]
      |> Module.split
      |> List.last
    link = ExAdmin.Utils.admin_resource_path conn.assigns[:resource], :index, [[order: nil]]

    paginate(link, page_number, page.page_size, page.total_pages, page.total_entries, model_name, show_information: true)
  end

end