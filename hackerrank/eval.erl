#!/usr/bin/env escript

main(_) -> 
  {ok, [N]} = io:fread("","~d"),
  List = read_input(N),
  lists:foreach(fun(E) -> io:format("~.4f~n", [calc(E)]) end, List),
  ok.

calc(X) -> calc(X, 10, 1).

calc(_,1,Acc) -> Acc;
calc(X,Pow,Acc) ->
  NPow = Pow - 1,
  calc(X, NPow, Acc + math:pow(X,NPow)/fac(NPow)).

fac(1) ->
    1;
fac(N) ->
    N * fac(N - 1).

read_input(0) -> [];
read_input(N) ->
  case io:fread("","~f") of
    {ok, [E]} -> [E | read_input(N-1)];
    _ -> []
  end.