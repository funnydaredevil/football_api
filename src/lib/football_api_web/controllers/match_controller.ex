defmodule FootballApiWeb.MatchController do
  use FootballApiWeb, :controller

  def index(conn, params) do
    matches = load_matches(params)

    render conn, "index.json", matches: matches
  end

  defp read_csv do
    File.stream!("/data/data.csv")
      |> Enum.drop(1)
      |> CSV.decode
  end

  defp load_matches(params) do
    FootballApi.CachedResource.load_resource("Match", params, &get_matches/1)
  end

  defp get_matches(%{"div" => div, "season" => season}) do
    read_csv()
      |> Enum.filter(fn x ->
        value_from_csv(x, CSVColumns.div) == div
          && value_from_csv(x, CSVColumns.season) == season 
      end)
  end

  defp get_matches(%{"season" => season}) do
    read_csv()
      |> Enum.filter(fn x ->
        value_from_csv(x, CSVColumns.season) == season
      end)
  end

  defp get_matches(%{"div" => div}) do
    read_csv()
      |> Enum.filter(fn x ->
        value_from_csv(x, CSVColumns.div) == div
      end)
  end

  defp get_matches(_) do
    read_csv()
  end

  defp value_from_csv(csv_row, column_name) do
    Enum.at(elem(csv_row, 1), column_name)
  end
end
