% 2. Determine the predecessor of a number represented as digits in a list. E.g.:
%    [1 9 3 6 0 0] --> [1 9 3 5 9 9]

% predecessor_(L : List, C : Integer, R : List)
% L - list of numerical atoms (only digits)
% C - numerical atom representing a carry
% R - the resulting list
% flow model (i, i, i), (i, o, o), (i, i, o), (i, o, i)
predecessor_([E], 1, [9]) :- E is 0, !.
predecessor_([E], 0, [R]) :- R is E - 1, !.
predecessor_([H | T], C, [R | RT]) :-
    predecessor_(T, 1, RT), !,
    predecessor_([H], C, [R]).
predecessor_([H | T], 0, [H | R]) :- predecessor_(T, 0, R).

% predecessor(L : List, R : List)
% wrapper for predecessor_
% L - list of numerical atoms (only digits)
% R - the resulting list
% flow model (i, i), (i, o)
predecessor(L, R) :- predecessor_(L, 0, R).
