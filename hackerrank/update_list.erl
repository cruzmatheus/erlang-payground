#!/usr/bin/env escript

main(_) ->
  List = read_input(),
  lists:map(fun(E) -> io:fwrite("~p~n", [E]) end, List).

read_input() ->
  case io:fread("","~d") of
    {ok, [N]} -> [abs(N) | read_input()];
    _ -> []
  end.