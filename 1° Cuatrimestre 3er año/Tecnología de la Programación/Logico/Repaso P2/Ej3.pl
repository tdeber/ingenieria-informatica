libro(rayuela, novela, largo).
libro(karamazov, novela, largo).
libro(octaedro, cuento, corto).
libro(inventario, poema, largo).
libro(leones, novela, corto).

mujer(haydee).
mujer(tania).

hombre(livio).
hombre(pedro).

abogado(haydee).
abogado(pedro).

ingeniero(haydee).

medico(tania).

contador(livio).

gusta(livio,rayuela).
gusta(pedro, X):-
             libro(X, cuento, _).

gusta(X,Y):- abogado(X),
             libro(Y, novela, largo).
gusta(X,Y):- ingeniero(X),
             libro(Y, novela, _).

gusta(X,Y):- medico(X),
             libro(Y, novela, _).
gusta(X,Y):- mujer(X),
             libro(Y, _, largo).
gusta(X,Y):- contador(X),
             hombre(X),
             libro(Y, poema, _).
gusta(X,Y):- contador(X),
             hombre(X),
             libro(Y, cuento, _).


