% Caso base: La lista vacía tiene 0 elementos.
contar([], 0).

% Caso recursivo: Una lista no vacía tiene 1 elemento más que la longitud de su cola.
contar([_|Resto], Resultado) :-
	contar(Resto, SubResultado), Resultado is SubResultado + 1. 
