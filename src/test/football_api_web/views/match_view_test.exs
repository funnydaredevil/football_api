defmodule FootballApiWeb.MatchViewTest do
  use FootballApiWeb.ConnCase, async: true
  alias FootballApiWeb.MatchView

  test "index.json" do
    match = {:ok, csv_match()}
    rendered_matches = MatchView.render("index.json", %{matches: [match]})

    assert rendered_matches == %{matches: [expected_match()]}
  end

  test "match.json" do
    match = {:ok, csv_match()}
    rendered_match = MatchView.render("match.json", %{match: match})

    assert rendered_match == expected_match()
  end

  defp csv_match do
    [
      "1",
      "SP1",
      "201516",
      "21/08/16",
      "Barcelona",
      "Real Madrid",
      "2",
      "1",
      "H",
      "2",
      "0",
      "H",
    ]
  end

  defp expected_match do
    %{
      id: "1",
      div: "SP1",
      season: "201516",
      date: "21/08/16",
      home_team: "Barcelona",
      away_team: "Real Madrid",
      fthg: "2",
      ftag: "1",
      ftr: "H",
      hthg: "2",
      htag: "0",
      htr: "H",
    }
  end
end