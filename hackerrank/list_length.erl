#!/usr/bin/env escript

main(_) ->
  List = read_input(),
  Length = count(List),
  io:fwrite("~p~n",[Length]).

count(List) -> count(List, 0).

count([],Acc) -> Acc;
count([_|T],Acc) -> count(T, Acc+1).

read_input() ->
  case io:fread("","~d") of
    {ok, [N]} -> [N | read_input()];
    _ -> []
  end.