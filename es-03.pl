% same(List1, List2)
% are the two lists exactly the same?
same(L, L).



greater(_, zero).
greater(s(N), s(M)) :- greater(N, M).
% all_bigger(List1,List2)
% all elements in List1 are bigger than those in List2, 1 by 1
% all_bigger(cons(s(s(zero)), cons(s(zero), nil)),cons(s( zero),cons(zero, nil))).
all_bigger(nil, nil).
all_bigger(cons(H1, T1), cons(H2, T2)) :- greater(H1, H2), all_bigger(T1, T2).



search(X, cons(X, _)).
search(X, cons(_, T)) :- search(X, T).
% sublist(List1 ,List2)
% List1 should contain elements all also in List2
% sublist(cons(a,cons(b,nil)), cons(c,cons(b,cons(a,nil)))).
sublist(nil, _).
sublist(cons(H, T), L) :- search(H, L), sublist(T, L).
