% last(List, N): N is the last element in List
% last(cons(zero, cons(zero, cons(s(zero), nil))), s(zero)).
last(cons(H, nil), H).
last(cons(_, T), O) :- last(T, O).



% map(ListIn, ListOut): ListOut[i] = ListIn[i] + 1
% map(cons(zero, cons(s(zero), nil)), X). yes -> X / cons(s(zero),cons(s(s(zero)),nil))
map(nil, nil).
map(cons(H1, T1), cons(s(H1), T2)) :- map(T1, T2).
