% 1.1) search(Elem, List)
search(X, cons(X, _)).
search(X, cons(_, T)) :- search(X, T).

% query:        search(a, cons(a,cons(b,cons(c,nil)))).
%               search(a, cons(c,cons(d,cons(e,nil)))).
% iteraton:     search(X, cons(a,cons(b,cons(c,nil)))).
% generation:   search(a, X).
%               search(a, cons(X,cons(b,cons(Y,cons(Z,nil))))).
%               search(X, Y).



% 1.2) search2(Elem, List)
% looks for two consecutive occurrences of Elem
search2(X, cons(X, cons(X, _))).
search2(X, cons(_, T)) :- search2(X, T).

% search2(a, cons(c,cons(a,cons(a,cons(d,cons(a,cons(a,nil))))))).
% search2(a, cons(c,cons(a,cons(a,cons(a,nil))))).
% search2(a, cons(c,cons(a,cons(a,cons(b,nil))))).
% search2(a, L).
% search2(a, cons(_,cons(a,cons(_,cons(a,cons(_,nil)))))).



% 1.3) search_two(Elem, List)
% looks for two occurrences of Elem with any element in between!
search_two(X, cons(X, cons(B, cons(X, _)))) :- X \= B.
search_two(X, cons(_, T)) :- search_two(X, T).

% search_two(a, cons(c,cons(a,cons(a,cons(b,nil))))). → no
% search_two(a, cons(c,cons(a,cons(d,cons(a,cons(b,nil)))))). → yes



% 1.4) search_anytwo(Elem, List)
% looks for any Elem that occurs two times, anywhere
search_anytwo(X, cons(X, T)) :- search(X, T).
search_anytwo(X, cons(_, T)) :- search_anytwo(X, T).

% search_anytwo(a, cons(c,cons(a,cons(a,cons(b,nil))))). → yes
% search_anytwo(a, cons(c,cons(a,cons(d,cons(a,cons(b,nil)))))). → yes



% 2.1) size(List ,Size)
% Size will contain the number of elements in List, written using notation zero , s(zero), s(s(zero))...
% size(cons(a,cons(b,cons(c,nil))), X). → X/s(s(s(zero)))
% size(L, s(s(s(zero)))).
size(nil, zero).
size(cons(_, T), s(N)) :- size(T, N).



% sum(A, B, A+B).
sum(N, zero, N).
sum(N, s(M), s(O)) :- sum(N, M, O).

% 2.2) sum_list(List, Sum) 2
% sum_list(cons(zero,cons(s(s(zero)),cons(s(zero),nil))), X). yes. → X/s(s(s(zero)))
sum_list(nil, zero).
sum_list(cons(H, T), O) :- sum_list(T, PS), sum(H, PS, O).



% 2.3) count(List, Element, NOccurrences)
% it uses count(List, Element, NOccurrencesSoFar, NOccurrences)
count(L, E, N) :- count(L, E, zero, N).
count(nil, _, N, N).
count(cons(_, T), E, N, M) :- count(T, E, s(N), M).
count(cons(H, T), E, N, M) :- H \= E, count(T, E, N, M).



greater(s(_), zero).
greater(s(N), s(M)) :- greater(N, M).
greaterEqual(_, zero).
greaterEqual(s(N), s(M)) :- greaterEqual(N, M).

% 2.4) max(List , Max)
% Max is the biggest element in List
% Suppose the list has at least one element
% max(cons(s(zero), cons(s(s(zero)), cons(zero, cons(s(s(s(zero))), nil)))), X). yes. → X / s(s(s(s(zero))))
max(cons(H, T), M) :- max(T, H, M).
max(nil, TM, TM).
max(cons(H, T), TM, M) :- greater(H, TM), max(T, H, M).
max(cons(H, T), TM, M) :- greaterEqual(TM, H), max(T, TM, M).



% 2.5) minMax(List,Min,Max)
% Min is the smallest element in List
% Max is the biggest element in List
% Suppose the list has at least one element
% minMax(cons(s(s(s(s(zero)))), cons(s(s(zero)), cons(zero, cons(zero, nil)))), Min, Max).
% yes. → Min / zero
% → Max / s(s(s(s(zero))))
minMax(cons(H, T), Min, Max) :- minMax(T, H, H, Min, Max).
minMax(nil, TMin, TMax, TMin, TMax).
minMax(cons(H, T), TMin, TMax, Min, Max) :- greater(H, TMax), minMax(T, TMin, H, Min, Max).
minMax(cons(H, T), TMin, TMax, Min, Max) :- greater(TMin, H), minMax(T, H, TMax, Min, Max).



% 3.1) same(List1, List2)
% are the two lists exactly the same? The two lists are equals, match together
same(L, L).



% 3.2) all_bigger(List1,List2)
% all elements in List1 are bigger than those in List2, 1 by 1
% all_bigger(cons(s(s(zero)), cons(s(zero), nil)),cons(s(zero),cons(zero, nil))).
all_bigger(nil, nil).
all_bigger(cons(H1, T1), cons(H2, T2)) :- greater(H1, H2), all_bigger(T1, T2).



search(X, cons(X, _)).
search(X, cons(_, T)) :- search(X, T).

% 3.3) sublist(List1 ,List2)
% List1 should contain elements all also in List2
% sublist(cons(a,cons(b,nil)), cons(c,cons(b,cons(a,nil)))).
sublist(nil, _).
sublist(cons(H, T), L) :- search(H, L), sublist(T, L).



% 4.1) seq(N,E,List) --> List is [E,E,...,E] with size N
% example: seq(s(s(s(zero))), a, cons(a,cons(a,cons(a, nil)))).
seq(zero, _, nil).
seq(s(N), E, cons(E,T)) :- seq(N, E, T).

% fully relational
% seq(X, Y, cons(a, cons(a, nil))). -> X / s(s(zero)), Y / a
% seq(s(s(s(zero))), a, L). -> L / cons(a,cons(a,cons(a,nil)))



% 4.2) seqR(N, List)
% seqR(s(s(s(zero))), cons(s(s(zero)),cons(s(zero),cons(zero,nil)))).
seqR(zero, nil).
seqR(s(N), cons(N, T)) :- seqR(N, T).



% append(List, e, List :: e)
% append(cons(a,cons(b,nil)),c,cons(a,cons(b,cons(c,nil)))).
append(nil, E, cons(E, nil)).
append(cons(H, T), E, cons(H, O)) :- append(T, E, O).

% 4.3) seqR2(N,List) --> is [0,1,...,N-1]
% seqR2(s(s(s(zero))),cons(zero,cons(s(zero),cons(s(s(zero)),nil)))).
seqR2(N, L) :- seqR2(N, nil, L).
seqR2(zero, L, L).
seqR2(s(N), L, LN) :- seqR2(N, L, O), append(O, N, LN).



% 5.1.a) last(List, N): N is the last element in List
% last(cons(zero, cons(zero, cons(s(zero), nil))), s(zero)).
last(cons(H, nil), H).
last(cons(_, T), O) :- last(T, O).



% 5.1.b) map(ListIn, ListOut): ListOut[i] = ListIn[i] + 1
% map(cons(zero, cons(s(zero), nil)), X). yes -> X / cons(s(zero),cons(s(s(zero)),nil))
map(nil, nil).
map(cons(H1, T1), cons(s(H1), T2)) :- map(T1, T2).



% 5.1.c) filter(ListIn, ListOut): ListOut = ListIn \ {x: x <= 0}
% filter(cons(zero, cons(s(sero), cons(zero, nil))),cons(s(sero), nil)).
filter(nil, nil).
filter(cons(H, T1), cons(H, T2)) :- greater(H, zero), filter(T, T2).
filter(cons(zero, T1), T2) :- filter(T1, T2).



% 5.2.a) count(List, N): N is the number of x > 0 in List
% count(cons(zero, cons(s(sero), cons(zero, nil))), s(zero))
count(nil, zero).
count(cons(H, T), s(N)) :- greater(H, zero), count(T, N).
count(cons(zero, T), N) :- count(T, N).



% 5.2.b) find(List, E): E is the first element > 0 in List
% find(cons(zero, cons(s(sero), cons(s(s(zero)), nil))), s(sero))
find(cons(H, T), H) :- greater(H, zero).
find(cons(zero, T), E) :- find(T, E).



% 5.3.a) dropRight(ListIn, N, ListOut): ListOut is ListIn without last N element
% dropRight(cons(a, cons(b, cons(c, nil))), s(s(zero)), cons(a, nil)).
% [a,b,c] drop 2 => [a]
dropRight(ListIn, N, ListOut) :- dropRight(ListIn, N, M, ListOut).
dropRight(nil, N, zero, nil).
dropRight(cons(H, T), N, s(M), cons(H, O)) :- dropRight(T, N, M, O), greaterEqual(M, N).
dropRight(cons(H, T), N, s(M), O) :- dropRight(T, N, M, O), greater(N, M).



% 5.3.b) dropWhile(ListIn, ListOut): ListOut is ListIn without longest prefix of element that match {x>0}
% [0, 0, 1, 0] dropWhile => [1, 0]
% dropWhile(cons(zero, cons(zero, cons(s(zero), cons(zero, nil)))), cons(s(zero), cons(zero, nil))).
dropWhile(cons(H, T), cons(H, T)) :- greater(H, zero).
dropWhile(cons(zero, T), L) :- dropWhile(T, L).



% 5.4.a) partition(List, ListYes, ListNot): List will be partitioned in
% - ListYes = {x in List: x > 0}
% - ListNot = {x in List: x = 0}
% partition(cons(zero, cons(s(s(zero)), cons(s(zero), cons(zero, nil)))), cons(s(s(zero)), cons(s(zero), nil)), cons(zero, cons(zero, nil))).
% [0, 1, 2, 0] partition => [1,2],[0,0]
partition(nil, nil, nil).
partition(cons(H, T), cons(H, L1), L2) :- greater(H, zero), partition(T, L1, L2).
partition(cons(zero, T), L1, cons(H, L2)) :- partition(T, L1, L2).



% 5.4.b) reversed(List, ListReversed): reverse the list
% reversed(cons(a, cons(b, cons(c, nil))), cons(c, cons(b, cons(a, nil))))
reversed(List, ListReversed) :- reversed(List, nil, ListReversed).
reversed(nil, Acc, Acc).
reversed(cons(H, T), Acc, L2) :- reversed(T, cons(H, Acc), L2).



% 5.5.a) drop(ListIn, N, ListOut): ListOut is ListIn without first N elements
% drop(cons(a, cons(b, cons(c, nil))), s(s(zero)), cons(c, nil))
% drop(nil, N, nil). -> with this we can drop more than ListIn elements, is it the right behaviour?
drop(T, zero, T).
drop(cons(H, T), s(N), O) :- drop(T, N, O).



% 5.5.b) take(ListIn, N, ListOut): ListOut is ListIn with first N elements
% take(cons(a, cons(b, cons(c, nil))), s(s(zero)), cons(a, cons(b, nil)))
% Cannot take more than ListIn elements
take(L, zero, nil).
take(cons(H, T), s(N), cons(H, O)) :- take(T, N, O).



% 5.5.c) zip(List1, List2, PairList):
% PairList[i] = pair(List1[i], List2[i])
% zip(cons(a, cons(b, cons(c, nil))), cons(c, cons(b, cons(a, nil))), cons(pair(a,c), cons(pair(b,b), cons(pair(c,a), nil))))
% zip(L, nil, nil). % -> with this, consider the shortest List
% zip(nil, L, nil). % -> is it the right behaviour?
zip(nil, nil, nil). % -> match only if List1 and List2 have same length
zip(cons(H1, T1), cons(H2, T2), cons(pair(H1, H2), O)) :- zip(T1, T2, O).
