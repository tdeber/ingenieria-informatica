


contar(_, [], 0). % Caso base: Si la lista está vacía, la cantidad es 0.
contar(Y, [Y|Resto], Cantidad) :- 
    contar(Y, Resto, CantidadResto), 
    Cantidad is CantidadResto + 1. 
contar(Y, [_|Resto], Cantidad) :- % Si el primer elemento de la lista no es 'Y'
    contar(Y, Resto, Cantidad). % Recursivamente contar en el resto de la lista
