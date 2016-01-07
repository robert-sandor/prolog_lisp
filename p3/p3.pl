% 10. Given a list of integer numbers. Remove all sub-lists formed from
%     decreasing elements.

remove_decreasing([], []) :- !.
remove_decreasing([E], [E]) :- !.
remove_decreasing([X, Y], []) :- X > Y, !.
remove_decreasing([X, Y, Z | T], R) :-
    X > Y,
    Y < Z,
    remove_decreasing([Z | T], R), !.
remove_decreasing([X, Y | T], R) :-
    X > Y,
    remove_decreasing([Y | T], R), !.
remove_decreasing([X | T], [X | R]) :- remove_decreasing(T, R).
