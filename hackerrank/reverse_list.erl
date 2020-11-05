#!/usr/bin/env escript

main(_) -> 
  List = read_input([]),
  lists:map(fun(E) -> io:fwrite("~p~n",[E]) end, List).

read_input(Acc) ->
  case io:fread("","~d") of
    {ok, [H]} -> read_input([H|Acc]);
    _ -> Acc
  end.