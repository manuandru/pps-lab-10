
% succ
% N e s(N) hanno in comune la proprietà succ
succ(N, s(N)).

% sum: NxN -> N
sum(zero, N, N).
sum(s(N), M, s(O)) :- sum(N, M, O).

% mul: NxN -> N
mul(zero, N, zero).
mul(s(N), M, O2) -> mul(N, M, O), sum(O, M, O2).

% dec: N -> N
dec(s(N), N).

% factorial: N -> N
factorial(zero, s(zero)).
factorial(s(N), O) :- factorial(N, O2), mul(O2, s(N), O).

% greater: NxN -> Boolean
greater(s(_), zero).
greater(s(M), s(N)) :- greater(M, N).

% range: NxN -> Many[N]


% nextprev: N -> NxN
nextprev(s(N), N, s(s(N))).



% find: LxE -> Boolean
find(cons(E, _), E).
find(cons(_, T), E) :- find(T, E).

% position: LxNxE -> Boolean
position(cons(E, _), zero, E).
position(cons(_, T), s(N), E) :- position(T, N, E).

% concat: LxL -> L
concat(nil, L, L).
concat(cons(H, T), L, cons(H, O)) :- concat(T, L, O).


