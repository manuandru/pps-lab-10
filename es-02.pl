% size(List ,Size)
% Size will contain the number of elements in List, written using notation zero , s(zero), s(s(zero))..
size(nil, zero).
size(cons(_, T), s(N)) :- size(T, N).

% size(cons(a,cons(b,cons(c,nil))), X). → X/s(s(s(zero)))
% size(L, s(s(s(zero)))).
