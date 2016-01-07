% subset(L : list, N : Integer, R : List, Rest : List)
% L - list of atoms
% N - length of the resulting list
% R - resulting list
% Rest - L without the elements from R
% flow model (i, i, o, o)
subset([],0,[],[]).
subset([H | T], N, [H | R], Rest) :-
    N1 is N - 1,
    subset(T, N1, R, Rest).
subset([H | T], N, R, [H | Rest]) :-
    subset(T, N, R, Rest).

% collinear(X : List, Y : List, Z : List)
% X, Y, Z - list of two numerical atoms, representing a point in plane
% true if X, Y, Z are collinear, false otherwise
% flow model (i, i, i)
collinear([A, B], [M, N], [X, Y]) :-
    P is (N - B)*(X - M),
    Q is (Y - N)*(M - A),
    P is Q.

% getcol(X : List, Y : List, L : List, R : List)
% X, Y - list of two numerical atoms, representing a point in plane
% L - list of lists of two numerical atoms, representing points in plane
% R - list of points collinear to X and Y
% flow model (i, i, i, o), (i, i, i, i)
getcol(X, Y, [], [X, Y]) :- !.
getcol(X, Y, [H | T], [H | R]) :-
    collinear(X, Y, H),
    getcol(X, Y, T, R).
getcol(X, Y, [_ | T], R) :-
    getcol(X, Y, T, R).

% genlist(L : List, R : List)
% L - list of lists of two numerical atoms, representing points in plane
% R - resulting list
% flow model (i, o) 
genlist(L, R) :-
    subset(L, 2, [X, Y], Rest),
    getcol(X, Y, Rest, R).
