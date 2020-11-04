#!/usr/bin/env escript

main(_) -> sum().

sum() ->
  {A,_} = string:to_integer(io:get_line("")),
  {B,_} = string:to_integer(io:get_line("")),
  io:format("~p~n",[A+B]).