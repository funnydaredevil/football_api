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
    
  end

  defp load_matches(params) do
    FootballApi.CachedResource.load_resource("Match", params, &get_matches/1)
  end

  defp get_matches(%{"div" => div, "season" => season} = params) do
    params
    |> read_csv()
    |> Enum.filter(fn x ->
      value_from_csv(x, CSVColumns.div) == div
        && value_from_csv(x, CSVColumns.season) == season 
    end)
    |> paginate(params)
  end

  defp get_matches(%{"season" => season} = params) do
    params
    |> read_csv()
    |> Enum.filter(fn x ->
      value_from_csv(x, CSVColumns.season) == season
    end)
    |> paginate(params)
  end

  defp get_matches(%{"div" => div} = params) do
    params
    |> read_csv()
    |> Enum.filter(fn x ->
      value_from_csv(x, CSVColumns.div) == div
    end)
    |> paginate(params)
  end

  defp get_matches(params) do
    params
    |> read_csv()
    |> paginate(params)
  end

  defp value_from_csv(csv_row, column_name) do
    Enum.at(elem(csv_row, 1), column_name)
  end

  defp paginate(matches, params) do
    pagination_params = pagination_config(params)
    matches
    |> Enum.slice(
      pagination_params["page"] * pagination_params["page_size"],
      pagination_params["page_size"]
    )
  end

  defp pagination_config(params) do
    {page, _} = Integer.parse(params["page"] || "0")
    {page_size, _} = Integer.parse(params["page_size"] || "10")
    %{"page" => page, "page_size" => page_size}
  end
end
