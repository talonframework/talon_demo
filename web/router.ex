defmodule NewAdmin.Router do
  use NewAdmin.Web, :router
  use ExAdmin.Router

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

  scope "/admin", NewAdmin do
    # pipe_through :api
    pipe_through :browser
    get "/:resource/search/:search_terms", AdminResourceController, :search
  end

  scope "/admin", NewAdmin do
    pipe_through :browser # Use the default browser stack
    admin_routes()
    # get "/:resource", AdminController, :index
  end

  scope "/", NewAdmin do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/tags", TagController
    resources "/groups", GroupController
    resources "/countries", CountryController
    resources "/states", StateController
    resources "/users", UserController
  end


  # Other scopes may use custom stacks.
  # scope "/api", NewAdmin do
  #   pipe_through :api
  # end
end
