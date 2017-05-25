defmodule TalonDemo.TalonResourceController do
  use TalonDemo.Web, :controller
  use Talon.Controller, repo: TalonDemo.Repo, context: TalonDemo.Talon

  plug Talon.Plug.TalonResource
  plug Talon.Plug.LoadResource
  plug Talon.Plug.LoadAssociations
  plug Talon.Plug.LoadAssociatedCollections when action in [:new, :edit]
  plug Talon.Plug.Theme
  plug Talon.Plug.Layout
  plug Talon.Plug.View

end
