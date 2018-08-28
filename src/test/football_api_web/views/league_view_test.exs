defmodule FootballApiWeb.LeagueViewTest do
  use FootballApiWeb.ConnCase, async: true
  alias FootballApiWeb.LeagueView

  test "index.json" do
    league = {"E0", ["201516", "201617"] }
    rendered_leagues = LeagueView.render("index.json", %{leagues: [league]})

    assert rendered_leagues == %{
      leagues: [%{"E0" => ["201516", "201617"]}]
    }
  end

  test "index.json with repeated leagues" do
    league = {"E0", ["201516", "201617", "201617"] }
    rendered_leagues = LeagueView.render("index.json", %{leagues: [league]})

    assert rendered_leagues == %{
      leagues: [%{"E0" => ["201516", "201617"]}]
    }
  end

  test "league.json" do
    league = {"E0", ["201516", "201617"] }
    rendered_league = LeagueView.render("league.json", %{league: league})

    assert rendered_league == %{"E0" => ["201516", "201617"]}
  end
end