defmodule Reactpxbp.Router do
  use Reactpxbp.Web, :router

  # temporary reference
  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # do not check for tokens
  # server generated login page
  pipeline :browser_login do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # check for tokens in header
  # main react container app
  pipeline :main_app do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # check for tokens, also for channel?
  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Reactpxbp do
    pipe_through :browser_login # browser login stack
  
    get "/", AuthController, :is_logged_in? #render login page if not logged in, otherwise go to app
    get "/login", AuthController, :login_page #render login page with phoenix
    get "/home", PageController, :main_app # render mainn page layout phoenix, the rest with react etc..
  end


  scope "/api", Reactpxbp do
    pipe_through :api
    post "/login", AuthController, :login_api
  end
  


  # Other scopes may use custom stacks.
  # scope "/api", Reactpxbp do
  #   pipe_through :api
  # end

  defp allowcreation?() do
    # return an array [:login] or [:login, :create]
    # based on a configuration option? 
  end

end
