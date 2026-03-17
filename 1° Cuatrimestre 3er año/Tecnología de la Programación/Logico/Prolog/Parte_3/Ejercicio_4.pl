suma([],0). % Caso Base, lista vacia por lo tanto resultado = 0.
suma([Y|Resto], Resultado):-
	% Suma recursiva

	suma(Resto, Subresultado), Resultado is Y + Subresultado.





