defmodule FootballApiWeb.MatchControllerTest do
  use FootballApiWeb.ConnCase

  test "GET /api/matches", %{conn: conn} do
    assert resp(conn, %{})["matches"] |> length == 2370
  end

  test "GET /api/matches?season=201516", %{conn: conn} do
    assert resp(conn, %{"season" => "201516"})["matches"] |> length == 842
  end

  test "GET /api/matches?div=SP2", %{conn: conn} do
    assert resp(conn, %{"div" => "SP2"})["matches"] |> length == 924
  end

  test "GET /api/matches?season=201617&div=SP2", %{conn: conn} do
    assert resp(conn, %{"season" => "201617", "div" => "SP2"})["matches"] |> length == 462
  end

  defp resp(conn, params) do
    conn
    |> get(match_path(conn, :index, params))
    |> json_response(200)
  end
end
