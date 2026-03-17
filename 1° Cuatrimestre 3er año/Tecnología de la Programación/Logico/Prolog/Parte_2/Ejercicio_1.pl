entradas('Empanada').
entradas('Sandwiches').
entradas('Arrollados').
plato_principal('Asado').
plato_principal('Milanesa').
plato_principal('Canelones').
postre('Helado').
postre('Flan').
postre('Lemon Pie').
carta(X, Y, Z) :-
	entradas(X), 
	plato_principal(Y), 
	postre(Z).
