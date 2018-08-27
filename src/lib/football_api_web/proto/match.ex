defmodule Messages do
  use Protobuf, "
    message MatchesResponse {
      repeated Match result = 1;
    }

    message Match {
      required string id = 1;
      required string div = 2;
      required string season = 3;
      required string date = 4;
      required string home_team = 5;
      required string away_team = 6;
      required string fthg = 7;
      required string ftag = 8;
      required string ftr = 9;
      required string hthg = 10;
      required string htag = 11;
      required string htr = 12;
    }
  "
end