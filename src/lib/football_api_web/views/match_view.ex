defmodule FootballApiWeb.MatchView do
  use FootballApiWeb, :view

  def render("index.json", %{matches: matches}) do
    %{matches: render_many(matches, FootballApiWeb.MatchView, "match.json")}
  end

  def render("match.json", %{match: match}) do
    %{
      id: elem(match, 1) |> Enum.at(CSVColumns.id),
      div: elem(match, 1) |> Enum.at(CSVColumns.div),
      season: elem(match, 1) |> Enum.at(CSVColumns.season),
      date: elem(match, 1) |> Enum.at(CSVColumns.date),
      home_team: elem(match, 1) |> Enum.at(CSVColumns.home_team),
      away_team: elem(match, 1) |> Enum.at(CSVColumns.away_team),
      fthg: elem(match, 1) |> Enum.at(CSVColumns.fthg),
      ftag: elem(match, 1) |> Enum.at(CSVColumns.ftag),
      ftr: elem(match, 1) |> Enum.at(CSVColumns.ftr),
      hthg: elem(match, 1) |> Enum.at(CSVColumns.hthg),
      htag: elem(match, 1) |> Enum.at(CSVColumns.htag),
      htr: elem(match, 1) |> Enum.at(CSVColumns.htr),
    }
  end
end
