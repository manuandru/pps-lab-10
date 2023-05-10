% seq(N,E,List) --> List is [E,E,...,E] with size N
% example: seq(s(s(s(zero))), a, cons(a,cons(a,cons(a, nil)))).
seq(zero, _, nil).
seq(s(N), E, cons(E,T)) :- seq(N, E, T).

% fully relational
% seq(X, Y, cons(a, cons(a, nil))). -> X / s(s(zero)), Y / a
% seq(s(s(s(zero))), a, L). -> L / cons(a,cons(a,cons(a,nil)))



% seqR(N, List)
% seqR(s(s(s(zero))), cons(s(s(zero)),cons(s(zero),cons(zero,nil)))).
seqR(zero, nil).
seqR(s(N), cons(H, T)) :- N = H, seqR(N, T).
