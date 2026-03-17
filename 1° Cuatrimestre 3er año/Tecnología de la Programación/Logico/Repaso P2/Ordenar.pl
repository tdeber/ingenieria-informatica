
ordenar([],[]).
ordenar([X|Xs],[Y|Ys]):-
                        X>Y,
                        ordenar([X|Xs],Ys).
ordenar([X|Xs],[Y|Ys]):-
                        X<Y,
                        ordenar([Y|Xs],Ys),
                        Y is X.
