
positivos([], []).
positivos([Y|Resto], [Y|Lista_Positivos]) :-
	%Se suma a la lista si es >0, si no no.
Y >= 0, 
	positivos(Resto, Lista_Positivos).
positivos([Y|Resto], Lista_Positivos) :-
	Y < 0, 
	positivos(Resto, Lista_Positivos).
