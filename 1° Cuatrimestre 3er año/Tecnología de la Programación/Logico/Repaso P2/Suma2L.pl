suma([],[],[]).

suma([X|Xs],[Y|Ys],[S|Ss]):-
                       X \= [],
                       Y \= [],
                       S is X+Y,
                       suma(Xs,Ys,Ss).
