defmodule FootballApiWeb.LeagueView do
  use FootballApiWeb, :view

  def render("index.json", %{leagues: leagues}) do
    %{leagues: render_many(leagues, FootballApiWeb.LeagueView, "league.json")}
  end

  def render("league.json", %{league: league}) do
    %{
      elem(league, 0) =>
        league
        |> elem(1)
        |> Enum.uniq
    }
  end
end
