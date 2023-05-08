% search(Elem, List)

search(X, cons(X, _)).
search(X, cons(_, T)) :- search(X, T).

% query: 			search(a, cons(a,cons(b,cons(c,nil)))).
%				 			search(a, cons(c,cons(d,cons(e,nil)))).
% iteraton: 	search(X, cons(a,cons(b,cons(c,nil)))).
% generation: search(a, X).
%							search(a, cons(X,cons(b,cons(Y,cons(Z,nil))))).
%							search(X, Y).