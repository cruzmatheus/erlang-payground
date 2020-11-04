-module(recursion).
-export([
  duplicate/2, tail_duplicate/2, 
  reverse/1, tail_reverse/1,
  sublist/2, tail_sublist/2,
  reverse_fold/1, filter/2]).

duplicate(0,_) -> [];
duplicate(N,Term) when N > 0 ->
  [Term | duplicate(N-1, Term)].

tail_duplicate(N,Term) -> tail_duplicate(N,Term,[]).

tail_duplicate(0,_,List) -> List;
tail_duplicate(N,Term,List) -> tail_duplicate(N-1,Term,[Term|List]).

reverse([]) -> [];
reverse([H|T]) -> reverse(T)++[H].

tail_reverse(L) -> tail_reverse(L,[]).

tail_reverse([], Acc) -> Acc;
tail_reverse([H|T],Acc) -> tail_reverse(T, [H|Acc]).

sublist(_,0) -> [];
sublist([],_) -> [];
sublist([H|T],N) when N > 0 -> [H|sublist(T,N-1)].

tail_sublist(L,N) -> reverse(tail_sublist(L,N,[])).

tail_sublist(_,0,SubList) -> SubList;
tail_sublist([], _, SubList) -> SubList;
tail_sublist([H|T], N, SubList) when N > 0 -> 
  tail_sublist(T, N-1, [H|SubList]).

fold(_, Start, []) -> Start;
fold(F, Start, [H|T]) -> fold(F, F(H,Start), T).

reverse_fold(L) ->
  fold(fun(X,Acc) -> [X|Acc] end, [], L).

filter(Predicate, List) ->
  F = fun(X,Acc) ->
    case Predicate(X) of
      true -> [X|Acc];
      false -> Acc
    end
  end,
  reverse(fold(F,[],List)).