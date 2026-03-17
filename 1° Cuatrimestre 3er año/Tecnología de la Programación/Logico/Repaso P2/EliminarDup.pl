eliminar_dup(X,Y):- eliminar_dup_aux(X,Y, []).

eliminar_dup([],[]).

eliminar_dup_aux([],[],_).

eliminar_dup_aux([X|Xs],Y,Aux):- member(X,Aux),!,eliminar_dup_aux(Xs,Y, Aux).

eliminar_dup_aux([X|Xs],[X|Ys],Aux):-
                                     eliminar_dup_aux(Xs, Ys, [X|Aux]).
                                     


