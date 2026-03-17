ins(X,L,[X | L]). %Aca pone el X como head de la lista, y L como el resto de la lista.
ins(X, [Y|L1], [Y|L2]) :-
	ins(X, L1, L2).%Reemplaza el head de las lista 1 por x y la asigna a la lista 2, que seria una nueva lista.

	per([], []).%Esto es caso base
	
	per([X|L], Lp)
	  :- per(L, L1), %Intercambia los elementos de la lista 1 con la 2 
			
	ins(X, L1, Lp). 

