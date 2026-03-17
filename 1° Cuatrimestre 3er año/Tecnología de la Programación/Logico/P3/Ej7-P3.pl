
eliminar_dup(L1,L2):-
                       eliminar_dup_aux(L1, [], L2).

eliminar_dup_aux([], _, []).

eliminar_dup_aux([X|Y], Aux, L2):-
                        member(X, Aux),
                        !,
                        eliminar_dup_aux(Y, Aux, L2).
                        
eliminar_dup_aux([X|Y], AUX, [X|L2]):-
                       eliminar_dup_aux(Y, [X|AUX], L2).
                        

