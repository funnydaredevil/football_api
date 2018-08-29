defmodule FootballApiWeb.MatchController do
  use FootballApiWeb, :controller

  def index(conn, params) do
    matches = load_matches(params)

    render conn, "index.json", matches: matches
  end

  defp read_csv(pagination_params) do
    File.stream!("/data/data.csv")
    |> CSV.decode
    |> Enum.drop(1)
    |> Enum.slice(
      pagination_params["page"] * pagination_params["page_size"],
      pagination_params["page_size"]
    )
  end

  defp load_matches(params) do
    FootballApi.CachedResource.load_resource("Match", params, &get_matches/1)
  end

  defp get_matches(%{"div" => div, "season" => season} = params) do
    params
    |> pagination_config()
    |> read_csv()
    |> Enum.filter(fn x ->
      value_from_csv(x, CSVColumns.div) == div
        && value_from_csv(x, CSVColumns.season) == season 
    end)
  end

  defp get_matches(%{"season" => season} = params) do
    params
    |> pagination_config()
    |> read_csv()
    |> Enum.filter(fn x ->
      value_from_csv(x, CSVColumns.season) == season
    end)
  end

  defp get_matches(%{"div" => div} = params) do
    params
    |> pagination_config()
    |> read_csv()
    |> Enum.filter(fn x ->
      value_from_csv(x, CSVColumns.div) == div
    end)
  end

  defp get_matches(params) do
    params
    |> pagination_config()
    |> read_csv()
  end

  defp value_from_csv(csv_row, column_name) do
    Enum.at(elem(csv_row, 1), column_name)
  end

  defp pagination_config(params) do
    {page, _} = Integer.parse(params["page"] || "1")
    {page_size, _} = Integer.parse(params["page_size"] || "10")
    %{"page" => page, "page_size" => page_size}
  end
end
