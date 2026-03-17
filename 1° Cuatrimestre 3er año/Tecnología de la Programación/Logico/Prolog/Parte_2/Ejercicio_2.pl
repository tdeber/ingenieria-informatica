% Definición de hechos

hombre('Juan').
hombre('Pedro').
hombre('Jose').
hombre('Alexis').
hombre('Valentin').
hombre('Elias').
hombre('Nicolas').

mujer('Maria').
mujer('Candela').
mujer('Mercedes').
mujer('Silvia').
mujer('Agustina').
mujer('Delfina').
mujer('Priscila').
mujer('Daiana').

progenitor('Juan', 'Pedro').
progenitor('Maria', 'Pedro').

progenitor('Juan', 'Jose').
progenitor('Maria', 'Jose').

progenitor('Elias', 'Juan').
progenitor('Agustina', 'Valentin').

progenitor('Pedro', 'Mercedes').
progenitor('Candela', 'Mercedes').

progenitor('Alexis', 'Valentin').
progenitor('Agustina', 'Valentin').

progenitor('Alexis', 'Silvia').
progenitor('Agustina', 'Silvia').

progenitor('Alexis', 'Delfina').
progenitor('Agustina', 'Delfina').

progenitor('Jose', 'Priscila').
progenitor('Delfina', 'Priscila').

progenitor('Jose', 'Daiana').
progenitor('Delfina', 'Daiana').
padre(X, Y) :-
	hombre(X), 
	progenitor(X, Y).
madre(X, Y) :-
	mujer(X), 
	progenitor(X, Y).
abuelo(X, Y) :-
	padre(X, Z), 
	progenitor(Z, Y).
abuelo(X, Y) :-
	madre(X, Z), 
	progenitor(Z, Y).
abuela(X, Y) :-
	madre(X, Z), 
	progenitor(Z, Y).
abuela(X, Y) :-
	padre(X, Z), 
	progenitor(Z, Y).
hermano(X, Y) :-
	progenitor(Z, X), 
	progenitor(Z, Y), X \= Y.
hermano_varon(X, Y) :-
	hombre(X), 
	hermano(X, Y).
hermana_mujer(X, Y) :-
	mujer(X), 
	hermano(X, Y).
sucesor(X, Y) :-
	progenitor(X, Y).
sucesor(X, Y) :-
	progenitor(X, Z), 
	sucesor(Z, Y).
es_madre(X) :-
	mujer(X), 
	progenitor(X, Y).
es_padre(X) :-
	hombre(X), 
	progenitor(X, Y).
tia(X, Y) :-
	mujer(X), 
	hermano(X, Z), 
	progenitor(Z, Y).
yerno(X, Y) :-
	hombre(X), 
	esposo(X, Z), 
	progenitor(Y, Z).
nuera(X, Y) :-
	mujer(X), 
	esposa(X, Z), 
	progenitor(Y, Z).

esposo('Alexis', 'Agustina').
esposa('Agustina', 'Alexis').

