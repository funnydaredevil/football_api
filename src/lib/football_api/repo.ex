defmodule FootballApi.Repo do
  @doc """
  Dynamically loads the repository url from the
  PG_REPO_URL environment variable.
  """
  def init(_, _opts) do
    {:ok, ''}
  end
end
