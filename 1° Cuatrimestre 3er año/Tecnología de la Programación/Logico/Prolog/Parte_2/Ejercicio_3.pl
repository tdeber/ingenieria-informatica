libro('La Cirenita', 'Novela', 'Larga').
libro('Juego de Tronos', 'Novela', 'Larga').
libro('Caperucita Roja', 'Cuento', 'Corto').
libro('Cenicienta', 'Novela', 'Corto').
libro('Harry Potter', 'Cuento', 'Larga').
libro('Leones', 'Novela', 'Corto').
libro('Mercedes', 'Poema', 'Larga').
libro('La sonada de mi guitarra', 'Poema', 'Corto').
libro('Rayuela', 'Novela', 'Larga').
libro('Karamazov', 'Novela', 'Larga').
libro('Mas Alla del Orden', 'Libro de cuentos', 'Largo').
libro('No me puedes lastimar', 'Libro de cuentos', 'Corto').
libro('Nunca Terminar', 'Libro de cuentos', 'Corto').
libro('Octaedro', 'Libro de cuentos', 'Corto').
libro('Inventario', 'Libro de poemas', 'Larga').


abogado('Haydee').
ingeniero('Haydee').
medico('Tania').
contador('Livio').
abogado('Pedro').
varon('Pedro').
varon('Livio').
mujer('Tania').
mujer('Haydee').
gusta(Persona, Libro) :-
	mujer(Persona), 
	libro(Libro, _, 'Larga').
gusta(Persona, Libro) :-
	(
		ingeniero(Persona);
		medico(Persona)), 
	libro(Libro, 'Novela', _).
gusta(Persona, Libro) :-
	abogado(Persona), 
	libro(Libro, 'Novela', 'Larga').
gusta(Persona, Libro) :-
	contador(Persona), 
	varon(Persona), 
	(
		libro(Libro, 'Libro de poemas', _);
		libro(Libro, 'Libro de cuentos', _)).

gusta('Livio', 'Rayuela').
gusta('Pedro', 'Octaedro').