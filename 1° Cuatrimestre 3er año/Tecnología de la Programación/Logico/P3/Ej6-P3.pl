
suma_lista([],[],[]).

suma_lista([X|Y],[A|B],[(P)|L]):-
                               X\=[],
                               A\=[],
                               P is X+A,
                               suma_lista(Y,B,L).

