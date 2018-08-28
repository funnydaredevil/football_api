defmodule FootballApiWeb.MatchView do
  use FootballApiWeb, :view

  def render("index.json", %{matches: matches}) do
    %{matches: render_many(matches, FootballApiWeb.MatchView, "match.json")}
  end

  def render("match.json", %{match: match}) do
    %{
      id: match |> elem(1) |> Enum.at(CSVColumns.id),
      div: match |> elem(1) |> Enum.at(CSVColumns.div),
      season: match |> elem(1) |> Enum.at(CSVColumns.season),
      date: match |> elem(1) |> Enum.at(CSVColumns.date),
      home_team: match |> elem(1) |> Enum.at(CSVColumns.home_team),
      away_team: match |> elem(1) |> Enum.at(CSVColumns.away_team),
      fthg: match |> elem(1) |> Enum.at(CSVColumns.fthg),
      ftag: match |> elem(1) |> Enum.at(CSVColumns.ftag),
      ftr: match |> elem(1) |> Enum.at(CSVColumns.ftr),
      hthg: match |> elem(1) |> Enum.at(CSVColumns.hthg),
      htag: match |> elem(1) |> Enum.at(CSVColumns.htag),
      htr: match |> elem(1) |> Enum.at(CSVColumns.htr),
    }
  end
end
