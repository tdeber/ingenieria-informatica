insertar(Elemento, [], [Elemento]). 

insertar(Elemento, [Y|Resto], [Elemento,Y|Resto]) :- 
    Elemento =< Y. 

insertar(Elemento, [Y|Resto], [Y|Lista_Resultado]) :- 
    Elemento > Y, 
    insertar(Elemento, Resto, Lista_Resultado).

ordenar([], []). 


ordenar([Y|Resto], Lista_ordenada) :-
    ordenar(Resto, Lista_ordenada_aux), % Ordena recursivamente el resto de la lista
    insertar(Y, Lista_ordenada_aux, Lista_ordenada). % Inserta el primer elemento en la nueva lista.



