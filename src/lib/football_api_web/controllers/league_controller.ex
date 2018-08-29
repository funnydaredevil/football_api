defmodule FootballApiWeb.LeagueController do
  use FootballApiWeb, :controller

  def index(conn, _params) do

    leagues = load_leagues()

    render conn, "index.json", leagues: leagues
  end

  defp load_leagues do
    FootballApi.CachedResource.load_resource("League", %{}, &get_leagues/1)
  end

  defp get_leagues(_params) do
    File.stream!("/data/data.csv")
    |> CSV.decode
    |> Enum.drop(1)
    |> Enum.group_by(
      fn x -> x
        |> elem(1)
        |> Enum.at(CSVColumns.div)
      end,
      fn x -> x
        |> elem(1)
        |> Enum.at(CSVColumns.season)
      end
    )
  end
end
