% search(Elem, List)
search(X, cons(X, _)).
search(X, cons(_, T)) :- search(X, T).

% query: 			search(a, cons(a,cons(b,cons(c,nil)))).
%				 			search(a, cons(c,cons(d,cons(e,nil)))).
% iteraton: 	search(X, cons(a,cons(b,cons(c,nil)))).
% generation: search(a, X).
%							search(a, cons(X,cons(b,cons(Y,cons(Z,nil))))).
%							search(X, Y).


% looks for two consecutive occurrences of Elem
% search2(Elem, List)
search2(X, cons(X, cons(X, _))).
search2(X, cons(_, T)) :- search2(X, T).

% search2(a, cons(c,cons(a,cons(a,cons(d,cons(a,cons(a,nil))))))).
% search2(a, cons(c,cons(a,cons(a,cons(a,nil))))).
% search2(a, cons(c,cons(a,cons(a,cons(b,nil))))).
% search2(a, L).
% search2(a, cons(_,cons(a,cons(_,cons(a,cons(_,nil)))))).
