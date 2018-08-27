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

  def render("index.proto", %{leagues: leagues}) do
    %{leagues: render_many(leagues, FootballApiWeb.LeagueView, "league.proto")}
  end

  def render("league.proto", %{league: league}) do
    %{
      elem(league, 0) => elem(league, 1) |> Enum.uniq
    }
    
    Messages.Match.new(
      id: match_obj.id,
      div: match_obj.div,
      season: match_obj.season,
      date: match_obj.date,
      home_team: match_obj.home_team,
      away_team: match_obj.away_team,
      fthg: match_obj.fthg,
      ftag: match_obj.ftag,
      ftr: match_obj.ftr,
      hthg: match_obj.hthg,
      htag: match_obj.htag,
      htr: match_obj.htr,
    )
  end
end
