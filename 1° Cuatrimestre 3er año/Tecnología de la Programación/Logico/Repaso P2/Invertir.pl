
invertir([],[]).
invertir([A|As],[Bs|A]):-
                         invertir(As, Bs).



