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


% last(List, e, List :: e)
% last(cons(a,cons(b,nil)),c,cons(a,cons(b,cons(c,nil)))).
last(nil, E, cons(E, nil)).
last(cons(H, T), E, cons(H, O)) :- last(T, E, O).

% seqR2(N,List) --> is [0,1,...,N-1]
% seqR2(s(s(s(zero))), cons(zero,cons(s(zero),cons(s(s(zero) ),nil)))).
seqR2(N, L) :- seqR2(N, nil, L).
seqR2(zero, L, L).
seqR2(s(N), L, LN) :- seqR2(N, L, O), last(O, N, LN).
