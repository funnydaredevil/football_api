defmodule FootballApi.CachedResource do
  @moduledoc """
    Common functions
  """
  def load_resource(resource, params, get_resource_function) do
    key = build_cache_key(resource, params)
    unless Cachex.exists?(:my_cache, key) == {:ok, true} do
      loaded = get_resource_function.(params)
      Cachex.put(:my_cache, key, loaded)
      loaded
    else
      Cachex.get!(:my_cache, key)
    end
  end

  defp build_cache_key(resource, params) do
    query_string = params
    |> Enum.map( fn({key, value}) -> "#{key}=#{value}" end)
    |> Enum.join("&")
    "#{resource}&#{query_string}"
  end
end
