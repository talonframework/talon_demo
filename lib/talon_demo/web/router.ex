defmodule TalonDemo.Web.Router do
  use TalonDemo.Web, :router
  use Talon.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/admin", TalonDemo.Web do
    pipe_through :browser
    talon_routes(TalonDemo.Admin)
  end

  scope "/", TalonDemo.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", TalonDemo.Web do
  #   pipe_through :api
  # end
end
