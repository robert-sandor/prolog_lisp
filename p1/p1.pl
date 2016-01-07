% 9.
% a. Transform a list in a set, in the order of the last appearance. E.g.:
%     [1,2,3,1,2] is transformed in [3,1,2].
% b. Define a predicate to determine the greatest common divisor of all
%     numbers in a list.

% a
% exists(L : List, E : Atom)
% L - list of atoms
% E - an atom
% true - if E exists in L, false otherwise
% flow model (i, i)
exists([H | _], E) :- E = H, !.
exists([_ | T], E) :- exists(T, E).

% transform(L : List, R : Set)
% L - list of atoms
% R - resulting set
% flow model (i, i), (i, o)
transform([], []).
transform([H | T], R) :-
    exists(T, H), !,
    transform(T, R).
transform([H | T], [H | R]) :- transform(T, R).

% b
% gcd(X : Integer, Y : Integer, D : Integer)
% X, Y - numerical atoms
% D - gcd of X and Y
% flow model (i, i, i), (i, i, o)
gcd(X, 0, X) :- !.
gcd(0, X, X) :- !.
gcd(X, Y, D) :- X =< Y, !, Z is Y - X, gcd(X, Z, D).
gcd(X, Y, D) :- gcd(Y, X, D).

% gcd_list(L : List, R : Integer)
% L - list of numerical atoms
% R - gcd of all numerical atoms from L
% flow model (i, i), (i, o)
gcd_list([E], E) :- !.
gcd_list([H1, H2 | T], R) :- gcd(H1, H2, D), gcd_list([D | T], R).
