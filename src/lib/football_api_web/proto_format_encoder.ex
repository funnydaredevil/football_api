defmodule FootballApiWeb.ProtoFormatEncoder do
  def encode_to_iodata!(artifact) do
    IO.inspect(artifact.matches.first.__struct__)
    artifact.matches |> Enum.map fn x -> x.__struct__.encode() end
    # artifact |> artifact.__struct__.encode()
  end

  def encode_to_iodata!(artifact=%{}) do
    IO.inspect(artifact)
    artifact |> Enum.map artifact.__struct__.encode()
  end
end