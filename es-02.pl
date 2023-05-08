% size(List ,Size)
% Size will contain the number of elements in List, written using notation zero , s(zero), s(s(zero))..
size(nil, zero).
size(cons(_, T), s(N)) :- size(T, N).

% size(cons(a,cons(b,cons(c,nil))), X). → X/s(s(s(zero)))
% size(L, s(s(s(zero)))).


% sum(A, B, A+B).
sum(N, zero, N).
sum(N, s(M), s(O)) :- sum(N, M, O).

% sum_list(List, Sum) 2
% sum_list(cons(zero,cons(s(s(zero)),cons(s(zero),nil))), X). yes. → X/s(s(s(zero)))
sum_list(nil, zero).
sum_list(cons(H, T), O) :- sum_list(T, PS), sum(H, PS, O).



% count(List, Element, NOccurrences)
% it uses count(List, Element, NOccurrencesSoFar, NOccurrences)
count(L, E, N) :- count(L, E, zero, N).
count(nil, E, N, N).
count(cons(H, T), E, N, M) :- count(T, E, s(N), M).
count(cons(H, T), E, N, M) :- H \= E, count(T, E, N, M).



greater(N, zero).
greater(s(N), s(M)) :- greater(N, M).
% max(List , Max)
% Max is the biggest element in List
% Suppose the list has at least one element
max(cons(H, T), M) :- max(T, H, M).
max(nil, TM, TM).
max(cons(H, T), TM, M) :- greater(H, TM), max(T, H, M).
max(cons(H, T), TM, M) :- greater(TM, H), max(T, TM, M).

% max(cons(s(zero), cons(s(s(zero)), cons(zero, cons(s(s(s(zero))), nil)))), X). yes. → X / s(s(s(s(zero))))



% minMax(List,Min,Max)
% Min is the smallest element in List
% Max is the biggest element in List
% Suppose the list has at least one element
minMax(cons(H, T), Min, Max) :- minMax(T, H, H, Min, Max).
minMax(nil, TMin, TMax, TMin, TMax).
minMax(cons(H, T), TMin, TMax, Min, Max) :- greater(H, TMax), minMax(T, TMin, H, Min, Max).
minMax(cons(H, T), TMin, TMax, Min, Max) :- greater(TMin, H), minMax(T, H, TMax, Min, Max).

% minMax(cons(s(s(s(s(zero)))), cons(s(s(zero)), cons(zero, cons(zero, nil)))), Min, Max).
% yes. → Min / zero
%			 → Max / s(s(s(s(zero))))
