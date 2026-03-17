
cantidad([],0).

cantidad([_|Y],C):-
                   cantidad(Y,C1),
                   C is C1 + 1.
