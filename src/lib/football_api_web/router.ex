defmodule FootballApiWeb.Router do
  use FootballApiWeb, :router

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

  scope "/", FootballApiWeb do
    pipe_through :browser # Use the default browser stack
  end

  # Other scopes may use custom stacks.
  scope "/api", FootballApiWeb do
    pipe_through :api

    get "/leagues", LeagueController, :index

    get "/matches", MatchController, :index
  end
end
