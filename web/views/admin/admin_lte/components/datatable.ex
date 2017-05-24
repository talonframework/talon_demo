defmodule ExAdmin.Datatable do
  defmacro __using__(opts) do
    quote do
      import unquote(__MODULE__)
      def render_table(conn, resources) do
        unquote(opts).render "datatable.html", conn: conn, resources: resources
      end
    end
  end

  def column_sort_link(conn, name) do
    order =
      case conn.params["order"] do
        nil -> "_desc"
        value ->
          if String.ends_with?(value, "_asc"), do: "_desc", else: "_asc"
      end
    page = conn.params["page"] || "1"

    ExAdmin.Utils.admin_resource_path(conn, :index, [[order: "#{name}" <> order, page: page]])
  end

  def sort_column_class(conn, name) do
    IO.inspect {name, conn.params}, label: "+++++"
    case sort_column_order(conn.params["order"]) do
      [{:asc, ^name}] -> " sorted-desc"
      [{:desc, ^name}] -> " sorted-asc"
      _ -> ""
    end
    |> IO.inspect(label: "result")
  end

  def sort_column_order(order) do
    cond do
      is_nil(order) ->
        []
      String.ends_with?(order, "_asc") ->
        [{:asc, order |> String.replace("_asc", "") |> String.to_atom}]
      String.ends_with?(order, "_desc") ->
        [{:desc, order |> String.replace("_desc", "") |> String.to_atom}]
      true ->
        []
    end
  end

end
