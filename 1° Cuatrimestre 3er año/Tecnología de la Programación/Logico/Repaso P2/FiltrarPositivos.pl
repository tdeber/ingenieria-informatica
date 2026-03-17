
positivos([],[]).

positivos([X|Y], [X|L]):-
                 X > 0,
                 positivos(Y,L).
                 
positivos([X|Y],L):-
                    X =< 0,
                    positivos(Y,L).
