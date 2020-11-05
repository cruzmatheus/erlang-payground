#!/usr/bin/env escript

main(_) ->
  Odds = [E || E <- read_input(), E rem 2 =/= 0],
  io:fwrite("~w~n", [lists:sum(Odds)]).

read_input() ->
  case io:fread("","~d") of
    {ok, [E]} -> [E | read_input()];
    _ -> []
  end.

