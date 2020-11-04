-module(functions).
-export([head/1, second/1]).

head([H|_]) -> H.
second([_,X|_]) -> X.