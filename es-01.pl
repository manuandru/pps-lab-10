% 1.1) search(Elem, List)
search(X, cons(X, _)).
search(X, cons(_, T)) :- search(X, T).

% query: 			search(a, cons(a,cons(b,cons(c,nil)))).
%				 			search(a, cons(c,cons(d,cons(e,nil)))).
% iteraton: 	search(X, cons(a,cons(b,cons(c,nil)))).
% generation: search(a, X).
%							search(a, cons(X,cons(b,cons(Y,cons(Z,nil))))).
%							search(X, Y).



% 1.2) search2(Elem, List)
% looks for two consecutive occurrences of Elem
search2(X, cons(X, cons(X, _))).
search2(X, cons(_, T)) :- search2(X, T).

% search2(a, cons(c,cons(a,cons(a,cons(d,cons(a,cons(a,nil))))))).
% search2(a, cons(c,cons(a,cons(a,cons(a,nil))))).
% search2(a, cons(c,cons(a,cons(a,cons(b,nil))))).
% search2(a, L).
% search2(a, cons(_,cons(a,cons(_,cons(a,cons(_,nil)))))).



% 1.3) search_two(Elem, List)
% looks for two occurrences of Elem with any element in between!
search_two(X, cons(X, cons(B, cons(X, _)))) :- X \= B.
search_two(X, cons(_, T)) :- search_two(X, T).

% search_two(a, cons(c,cons(a,cons(a,cons(b,nil))))). → no
% search_two(a, cons(c,cons(a,cons(d,cons(a,cons(b,nil)))))). → yes



% 1.4) search_anytwo(Elem, List)
% looks for any Elem that occurs two times, anywhere
search_anytwo(X, cons(X, T)) :- search(X, T).
search_anytwo(X, cons(_, T)) :- search_anytwo(X, T).

% search_anytwo(a, cons(c,cons(a,cons(a,cons(b,nil))))). → yes
% search_anytwo(a, cons(c,cons(a,cons(d,cons(a,cons(b,nil)))))). → yes
