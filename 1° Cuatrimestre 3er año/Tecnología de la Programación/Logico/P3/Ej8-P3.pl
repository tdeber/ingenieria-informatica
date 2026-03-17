
insertar([],[],[]).
insertar(X, [], [X]).

insertar(E, [X|Y], [E,X|Y]):-
                E =< X.

insertar(E, [X|Y], [X|R]):-
            E > X,
            insertar(E, Y, R).
