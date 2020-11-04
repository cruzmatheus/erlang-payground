#!/usr/bin/env escript

main(_) -> 
  {ok, [Min]} = io:fread("", "~d"),
  List = read_input([]),
  Result = lists:reverse(lists:filter(fun(E) -> E < Min end, List)),
  print(Result).

read_input(T) ->
  case io:fread("","~d") of
    {ok, [H]} -> read_input([H|T]);
    _ -> T
  end.

print(List) ->
  lists:map(fun(E) -> io:fwrite("~p~n",[E]) end, List).