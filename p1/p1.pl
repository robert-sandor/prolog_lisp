% 9.
% a. Transform a list in a set, in the order of the last appearance. E.g.:
%     [1,2,3,1,2] is transformed in [3,1,2].
% b. Define a predicate to determine the greatest common divisor of all
%     numbers in a list.

% a
exists([H | _], E) :- E = H, !.
exists([_ | T], E) :- exists(T, E).

transform([], []).
transform([H | T], R) :-
    exists(T, H), !,
    transform(T, R).
transform([H | T], [H | R]) :- transform(T, R).

% b
gcd(X, 0, X) :- !.
gcd(0, X, X) :- !.
gcd(X, Y, D) :- X =< Y, !, Z is Y - X, gcd(X, Z, D).
gcd(X, Y, D) :- gcd(Y, X, D).

gcd_list([E], E) :- !.
gcd_list([H1, H2 | T], R) :- gcd(H1, H2, D), gcd_list([D | T], R).
