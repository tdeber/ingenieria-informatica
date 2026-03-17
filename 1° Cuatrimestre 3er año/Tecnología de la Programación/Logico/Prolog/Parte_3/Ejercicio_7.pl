
eliminar_dup(Lista, SinDup) :-
	eliminar_dup_aux(Lista, [], SinDup).

% Caso base: cuando la lista original está vacía, la lista sin duplicados es la acumulada.
eliminar_dup_aux([], Acum, Acum).

% Caso recursivo: el elemento no está en la lista acumulada, lo agregamos.
eliminar_dup_aux([Y|Lista], Acum, SinDup) :-
	 \+ member(Y, Acum), % Si Y no esta presenta o no forma parte de la sublista Acum, entonces se procede a la operacion.
	
	eliminar_dup_aux(Lista, [Y|Acum], SinDup).
eliminar_dup_aux([Y|Lista], Acum, SinDup) :-
	member(Y, Acum), 
	eliminar_dup_aux(Lista, Acum, SinDup).
