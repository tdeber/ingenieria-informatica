
cantidad([],0).

cantidad([_|Y], Elementos):-
                cantidad(Y, E1),
                Elementos is E1 + 1.
