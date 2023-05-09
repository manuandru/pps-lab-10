% same(List1, List2)
% are the two lists exactly the same?
same(L, L).



greater(N, zero).
greater(s(N), s(M)) :- greater(N, M).
% all_bigger(List1,List2)
% all elements in List1 are bigger than those in List2, 1 by 1
% all_bigger(cons(s(s(zero)), cons(s(zero), nil)),cons(s( zero),cons(zero, nil))).
all_bigger(nil, nil).
all_bigger(cons(H1, T1), cons(H2, T2)) :- greater(H1, H2), all_bigger(T1, T2).
