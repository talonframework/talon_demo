defmodule TalonDemo.Router do
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

  scope "/talon", TalonDemo do
    pipe_through :browser # Use the default browser stack
    talon_routes()
    # get "/:resource", TalonController, :index
  end

  scope "/", TalonDemo do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/tags", TagController
    resources "/groups", GroupController
    resources "/countries", CountryController
    resources "/states", StateController
    resources "/users", UserController
  end


  # Other scopes may use custom stacks.
  # scope "/api", TalonDemo do
  #   pipe_through :api
  # end
end
