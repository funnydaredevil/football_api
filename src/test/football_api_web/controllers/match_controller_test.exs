defmodule FootballApiWeb.MatchControllerTest do
  use FootballApiWeb.ConnCase

  test "GET /api/matches", %{conn: conn} do
    assert resp(conn, %{})["matches"] |> length == 10
  end

  test "GET /api/matches?season=201516", %{conn: conn} do
    assert resp(conn, %{"season" => "201516"})["matches"] |> length == 10
  end

  test "GET /api/matches?div=SP2", %{conn: conn} do
    assert resp(conn, %{"div" => "SP2"})["matches"] |> length == 10
  end

  test "GET /api/matches?div=SP2&page_size=20", %{conn: conn} do
    assert resp(conn, %{"div" => "SP2", "page_size" => "20"})["matches"] |> length == 20
  end

  test "GET /api/matches?div=SP2&page=2&page_size=30", %{conn: conn} do
    assert resp(conn, %{"div" => "SP2", "page" => "2", "page_size" => "30"})["matches"] |> length == 30
  end

  test "GET /api/matches?season=201617&div=SP2", %{conn: conn} do
    assert resp(conn, %{"season" => "201617", "div" => "SP2"})["matches"] |> length == 10
  end

  defp resp(conn, params) do
    conn
    |> get(match_path(conn, :index, params))
    |> json_response(200)
  end
end
