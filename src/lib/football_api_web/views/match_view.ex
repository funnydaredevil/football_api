defmodule FootballApiWeb.MatchView do
  use FootballApiWeb, :view
  use Protobuf, from: Path.wildcard(Path.expand("./proto/match.proto", __DIR__))

  def render("index.json", %{matches: matches}) do
    %{matches: render_many(matches, FootballApiWeb.MatchView, "match.json")}
  end

  def render("match.json", %{match: match}) do
    match_object(match)
  end

  def render("index.proto", %{matches: matches}) do
    %{matches: render_many(matches, FootballApiWeb.MatchView, "match.proto")}
  end

  def render("match.proto", %{match: match}) do
    match_obj = match_object(match)
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

  defp match_object(match) do
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
