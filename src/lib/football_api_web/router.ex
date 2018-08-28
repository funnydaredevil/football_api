defmodule FootballApiWeb.Router do
  use FootballApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Other scopes may use custom stacks.
  scope "/api", FootballApiWeb do
    pipe_through :api

    get "/leagues", LeagueController, :index

    get "/matches", MatchController, :index
  end
end
