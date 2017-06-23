defmodule TalonDemo.Web.TalonPageController do
  use TalonDemo.Web, :controller
  use Talon.PageController, concern: TalonDemo.Admin

  plug Talon.Plug.LoadConcern, concern: TalonDemo.Admin, web_namespace: Web
  plug Talon.Plug.Theme
  plug Talon.Plug.Layout, layout: {Elixir.TalonDemo.Admin.AdminLte.Web.LayoutView, "app.html"}
  plug Talon.Plug.View
  
  # TODO
  
end
