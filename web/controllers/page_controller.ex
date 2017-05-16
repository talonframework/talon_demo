defmodule NewAdmin.PageController do
  use NewAdmin.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
