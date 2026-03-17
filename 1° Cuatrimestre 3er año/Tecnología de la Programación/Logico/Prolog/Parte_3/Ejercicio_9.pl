% Caso base
insertar(Elemento, [], [Elemento]).

%insertar cuando el elemento es mayor o igual al primer elemento de la lista.
insertar(Elemento, [Y|Lista], [Y|Lista_Resultado]) :-
	Elemento >= Y, 
	insertar(Elemento, Lista, Lista_Resultado).

% insertar cuando el elemento es menor que el primer elemento de la lista.
insertar(Elemento, [Y|Lista], [Elemento, Y|Lista]) :-
	Elemento < Y.


