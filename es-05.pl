% last(List, N): N is the last element in List
% last(cons(zero, cons(zero, cons(s(zero), nil))), s(zero)).
last(cons(H, nil), H).
last(cons(_, T), O) :- last(T, O).
