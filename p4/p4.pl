subset([],0,[],[]).
subset([H | T], N, [H | R], Rest) :-
    N1 is N - 1,
    subset(T, N1, R, Rest).
subset([H | T], N, R, [H | Rest]) :-
    subset(T, N, R, Rest).

collinear([A, B], [M, N], [X, Y]) :-
    P is (N - B)*(X - M),
    Q is (Y - N)*(M - A),
    P is Q.

getcol(X, Y, [], [X, Y]) :- !.

getcol(X, Y, [H | T], [H | R]) :-
    % X =!= H,
    % Y =!= H,
    collinear(X, Y, H),
    getcol(X, Y, T, R).

getcol(X, Y, [_ | T], R) :-
    getcol(X, Y, T, R).

genlist(L, R) :-
    subset(L, 2, [X, Y], Rest),
    getcol(X, Y, Rest, R).
