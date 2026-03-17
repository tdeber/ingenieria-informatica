hombre(['raul','alejandro','matias','osvaldo','oscar','emiliano','tomas']).
mujer(['liliana','susana','cintia','judith', 'lorena']).

es_hombre(X):- hombre(Hombres), member(X, Hombres).
es_mujer(Y):- mujer(Mujeres), member(Y, Mujeres).

progenitor(raul, cintia).
progenitor(raul, alejandro).
progenitor(raul, matias).
progenitor(liliana, cintia).
progenitor(liliana, alejandro).
progenitor(liliana, matias).

progenitor(osvaldo, oscar).
progenitor(osvaldo, lorena).
progenitor(osvaldo, judith).
progenitor(susana, oscar).
progenitor(susana, lorena).
progenitor(susana, judith).

progenitor(oscar, emiliano).
progenitor(oscar, tomas).
progenitor(cintia, emiliano).
progenitor(cintia, tomas).

padre(P, H):- es_hombre(P),progenitor(P, H).
madre(M, H):- es_mujer(M),progenitor(M, H).

abuelo(A, N):- es_hombre(A), progenitor(A, PM),
                             progenitor(PM, N).

abuela(A, N):- es_mujer(A), progenitor(A, PM),
                             progenitor(PM, N).

hermanos(H1, H2):- progenitor(PM, H1), progenitor(PM, H2), H1\=H2.
hermano(H1, H2):- es_hombre(H1), progenitor(P, H1), progenitor(P, H2), H1\=H2.
hermana(H1, H2):- es_mujer(H1), progenitor(P, H1), progenitor(P, H2), H1\=H2.

sucesor(H, PM):- progenitor(PM, H).

es_madre(Madre):- es_mujer(Madre), progenitor(Madre, _).
es_padre(Padre):- es_hombre(Padre), progenitor(Padre, _).

tia(T, S):- es_mujer(T),progenitor(P, S), hermana(T, P).
yerno(Y, H):- es_hombre(Y), progenitor(Y, NN), (abuelo(H, NN);abuela(H, NN)).
nuera(N, H):- es_mujer(N), progenitor(N, NN), (abuelo(H, NN); abuela(H, NN)).




