defmodule AdminLte.Paginate do
  use Phoenix.View, root: "web/templates/admin/admin_lte/components"
  use ExAdmin.Web, :view
  import Phoenix.HTML.Tag
  import Phoenix.HTML.Link
  import ExAdmin.Utils, only: [to_integer: 1]

  def paginate(%{params: params} = conn) do
    page_number = to_integer(params["page"] || 1)
    page = conn.assigns[:page]
    model_name =
      conn.assigns[:resource]
      |> Module.split
      |> List.last
    link = ExAdmin.Utils.admin_resource_path conn.assigns[:resource], :index, [[order: nil]]

    paginate(link, page_number, page.page_size, page.total_pages, page.total_entries, model_name)
  end

  def paginate(link, page_number, page_size, total_pages, record_count, name) do
    [
      content_tag :ul, class: "pagination pagination-sm no-margin pull-right" do
        if total_pages > 1 do
          for item <- items(page_number, page_size, total_pages) do
            build_item link, item
          end
        else
          []
        end
      end,
      content_tag :ul, class: "pagination_information" do
        record_number = (page_number - 1) * page_size + 1
        display_pagination name, (page_number - 1) * page_size + 1, page_size,
                           record_count, record_number + page_size - 1
      end
    ]
    |> Phoenix.HTML.Safe.List.to_iodata
    |> Phoenix.HTML.raw
  end

  def build_item(_, {:current, num}) do
    content_tag :li, class: "active" do
      link "#{num}", to: "#"
    end
  end
  def build_item(_, {:gap, _}) do
    content_tag :li, class: "page gap" do
      content_tag :span do
        " ..."
      end
    end
  end

  def build_item(link, {item, num}) when item in [:first, :prev, :next, :last] do
    content_tag :li do
      link "#{special_name item}", to: "#{link}&page=#{num}"
    end
  end

  def build_item(link, {_item, num}) do
    content_tag :li do
      link "#{num}", to: "#{link}&page=#{num}"
    end
  end


  defp display_pagination(name, _record_number, 1, record_count, _) do
    pagination_information(name, record_count)
  end
  defp display_pagination(name, record_number, _page_size, record_count, last_number)
      when last_number < record_count do
    pagination_information(name, record_number, last_number, record_count)
  end
  defp display_pagination(name, record_number, _page_size, record_count, _) do
    pagination_information(name, record_number, record_count, record_count)
  end

  def pagination_information(name, record_number, record_number, record_count) do
    [
      "Displaying"  <> Inflex.singularize(" #{name}") <> " ",
      content_tag(:b, do: "#{record_number}"),
      " " <> "of" <> " ",
      content_tag(:b, do: "#{record_count}"),
      " " <> ("in total")
    ]
    |> Phoenix.HTML.Safe.List.to_iodata
    |> Phoenix.HTML.raw
  end

  def pagination_information(name, record_number, last, record_count) do
    [
      ("Displaying #{name}") <> " ",
      content_tag(:b, do: "#{record_number} - #{last}"),
      " " <> ("of") <> " ",
      content_tag(:b, do: "#{record_count}"),
      " " <> (gettext "in total")
    ]
    |> Phoenix.HTML.Safe.List.to_iodata
    |> Phoenix.HTML.raw
  end

  def pagination_information(name, total) do
    [
      "Displaying" <> " ",
      content_tag(:b, do: ("all #{total}")),
      " #{name}"
    ]
    |> Phoenix.HTML.Safe.List.to_iodata
    |> Phoenix.HTML.raw
  end


  def special_name(:first), do: gettext "« First"
  def special_name(:prev), do: gettext "‹ Prev"
  def special_name(:next), do: gettext "Next ›"
  def special_name(:last), do: gettext "Last »"

  def window_size, do: 7

  def items(page_number, page_size, total_pages) do

    prefix_links(page_number)
    |> prefix_gap
    |> links(page_number, page_size, total_pages)
    |> postfix_gap
    |> postfix_links(page_number, total_pages)
  end

  def prefix_links(1), do: []
  def prefix_links(page_number) do
    prev = if page_number > 1, do: page_number - 1, else: 1
    [first: 1, prev: prev]
  end

  def prefix_gap(acc) do
    acc
  end

  def postfix_gap(acc), do: acc

  def links(acc, page_number, _page_size, total_pages) do
    half = Kernel.div window_size(), 2
    before = cond do
      page_number == 1 -> 0
      page_number - half < 1 -> 1
      true -> page_number - half
    end
    aftr = cond do
      before + half >= total_pages -> total_pages
      page_number + window_size() >= total_pages -> total_pages
      true -> page_number + half
    end
    before_links = if before > 0 do
      for x <- before..(page_number - 1), do: {:page, x}
    else
      []
    end
    after_links = if page_number < total_pages do
      for x <- (page_number + 1)..aftr, do: {:page, x}
    else
      []
    end
    pregap = if before != 1 and page_number != 1, do: [gap: true], else: []
    postgap = if aftr != total_pages and page_number != total_pages, do: [gap: true], else: []
    acc ++ pregap ++ before_links ++ [current: page_number] ++ after_links ++ postgap
  end

  def postfix_links(acc, page_number, total_pages) do
    if page_number == total_pages do
      acc
    else
      acc ++ [next: page_number + 1, last: total_pages]
    end
  end
end