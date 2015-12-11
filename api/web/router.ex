defmodule Api.Router do
  use Api.Web, :router

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

  scope "/", Api do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", Api do
    pipe_through :api

    resources "/shoppers", ShopperController, except: [:edit]
    get "/shoppers/username/:username", ShopperController, :showuser
    resources "/products", ProductController, except: [:edit]
  end
end
