
suma([],0).

suma([X|Y], S):-
            suma(Y, S1),
            S is S1 + X.
