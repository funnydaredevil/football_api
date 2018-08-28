defmodule FootballApiWeb.LeagueControllerTest do
  use FootballApiWeb.ConnCase

  test "GET /api/leagues", %{conn: conn} do
    conn = get conn, "/api/leagues"

    response =
      conn
      |> get(league_path(conn, :index))
      |> json_response(200)

    expected = %{"leagues" => [
      %{"D1" => ["201617"]},
      %{"E0" => ["201617"]},
      %{"SP1" => ["201617", "201516"]},
      %{"SP2" => ["201617", "201516"]}
    ]}

    assert response == expected
  end
end
