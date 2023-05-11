% last(List, N): N is the last element in List
% last(cons(zero, cons(zero, cons(s(zero), nil))), s(zero)).
last(cons(H, nil), H).
last(cons(_, T), O) :- last(T, O).



% map(ListIn, ListOut): ListOut[i] = ListIn[i] + 1
% map(cons(zero, cons(s(zero), nil)), X). yes -> X / cons(s(zero),cons(s(s(zero)),nil))
map(nil, nil).
map(cons(H1, T1), cons(s(H1), T2)) :- map(T1, T2).


greater(s(_), zero).
greater(s(N), s(M)) :- greater(N, M).
% filter(ListIn, ListOut): ListOut = ListIn \ {x: x <= 0}
% filter(cons(zero, cons(s(sero), cons(zero, nil))),cons(s(sero), nil)).
filter(nil, nil).
filter(cons(H1, T1), cons(H1, T2)) :- greater(H1, zero), filter(T1, T2).
filter(cons(H1, T1), T2) :- H1 = zero, filter(T1, T2).



% count(List, N): N is the number of x > 0 in List
% count(cons(zero, cons(s(sero), cons(zero, nil))), s(zero))
count(nil, zero).
count(cons(H, T), s(N)) :- greater(H, zero), count(T, N).
count(cons(H, T), N) :- H = zero, count(T, N).
