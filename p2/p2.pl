% 2. Determine the predecessor of a number represented as digits in a list. E.g.:
%    [1 9 3 6 0 0] --> [1 9 3 5 9 9]

predecessor_([E], 1, [9]) :- E is 0, !.
predecessor_([E], 0, [R]) :- R is E - 1, !.
predecessor_([H | T], C, [R | RT]) :-
    predecessor_(T, 1, RT), !,
    predecessor_([H], C, [R]).
predecessor_([H | T], 0, [H | R]) :- predecessor_(T, 0, R).

predecessor(L, R) :- predecessor_(L, 0, R).
