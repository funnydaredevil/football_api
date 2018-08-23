defmodule FootballApiWeb.LeagueController do
  use FootballApiWeb, :controller

  def index(conn, _params) do
    
    leagues =
      File.stream!("/data/data.csv")
      |> CSV.decode
      |> Enum.drop(1)
      |> Enum.group_by(
          fn x -> elem(x, 1) |> Enum.at(CSVColumns.div) end,
          fn x -> elem(x, 1) |> Enum.at(CSVColumns.season) end
      )
    
    render conn, "index.json", leagues: leagues
  end
end
