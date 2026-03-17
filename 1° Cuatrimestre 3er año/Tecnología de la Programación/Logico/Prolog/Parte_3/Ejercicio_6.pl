suma_lista([],[],[]).
suma_lista([X|Resto_1], [Y|Resto_2], [Z|Lista_suma]) :-
	Z is X + Y, 
	suma_lista(Resto_1, Resto_2, Lista_suma).
