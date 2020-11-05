#!/usr/bin/env escript

main(_) -> 
  {ok, [Times]} = io:fread("", "~d"),
  Replicated = replicate(Times,read_input([]),[]),
  Result = lists:reverse(lists:flatten(Replicated)),
  lists:map(fun(Element) -> io:fwrite("~w~n", [Element]) end, Result).

read_input(T) ->
  case io:fread("","~d") of
    {ok, [H]} -> read_input([H|T]);
    _ -> T
  end.

replicate(_,[],Acc) -> Acc;
replicate(Times,[H|T],Acc) ->
  replicate(Times,T,[replicate_list_element(Times,H,[])|Acc]).

replicate_list_element(0,_, Acc) -> Acc;
replicate_list_element(Times,Element, Acc) -> replicate_list_element(Times-1, Element, [Element|Acc]).
