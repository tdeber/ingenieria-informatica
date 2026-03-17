libro('Rayuela','Novela','Larga').
libro('Karamazov','Novela','Larga').
libro('Octaedro','Cuento','Corta').
libro('Inventario','Poema','Larga').
libro('Leones','Novela','Corta').

mujer(['Haydee','Tania']).
hombre(['Livio','Pedro']).

abogado('Haydee').
abogado('Pedro').
ingeniero('Haydee').
medico('Tania').
contador('Livio').

gusta(X, Y):- abogado(X), libro(Y,'Novela','Larga').
gusta(X, Y):- ingeniero(X), libro(Y,'Novela',_).

gusta(X, Y):- mujer(Mujeres),member(X, Mujeres), libro(Y, _ ,'Larga').

gusta(X, Y):- contador(X), hombre(Hombres), member(X, Hombres), libro(Y, 'Cuento',_).
gusta(X, Y):- contador(X), hombre(Hombres), member(X, Hombres), libro(Y, 'Poema',_).

gusta('Livio', 'Rayuela').
gusta('Pedro', Y):- libro(Y,'Cuento',_).




