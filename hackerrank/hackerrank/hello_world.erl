#!/usr/bin/env escript

main([N]) -> repeat(list_to_integer(N)).

repeat(0) -> "";
repeat(Num) when is_integer(Num) -> 
  io:fwrite("Hello World~n"),
  repeat(Num-1).

