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
