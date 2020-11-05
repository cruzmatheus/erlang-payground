#!/usr/bin/env escript

main(_) -> 
  {ok,[N]} = io:fread("","~d"),
  Res = lists:seq(1, N),
  io:format("~w~n",[Res]).