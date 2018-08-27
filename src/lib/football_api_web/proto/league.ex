defmodule Messages do
  use Protobuf, "
    message League {
      required string div = 1;
      enum Season {}
      optional Season season = 2;
    }
  "
end