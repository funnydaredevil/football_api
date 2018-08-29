defmodule FootballApi.CachedResource do
  @moduledoc """
    Module for handling cached resources
  """
  def load_resource(resource, params, get_resource_function) do
    key = build_cache_key(resource, params)
    Cachex.exists?(:my_cache, key)
    |> get_resource(key, params, get_resource_function)
  end

  defp get_resource({:ok, true}, key, _, _) do
    Cachex.get!(:my_cache, key)
  end

  defp get_resource(_, key, params, get_resource_function) do
    loaded = get_resource_function.(params)
    Cachex.put(:my_cache, key, loaded)
    loaded
  end

  defp build_cache_key(resource, params) do
    query_string = params
    |> Enum.map(fn({key, value}) -> "#{key}=#{value}" end)
    |> Enum.join("&")
    "#{resource}&#{query_string}"
  end
end
