p(1).
p(2) :-
	!.
p(3).
%Lo que puedo deducir de esto, es que prolog ejecuta la secuencia p hasta el valor 2, luego por condicion de corte ya no se ejecuta mas.
%En prolog la primera sentencia hace p(x), primero X =1 y luego vale 2.
%Explicacion de gpt:
    %Segunda sentencia:
    %Esta consulta solicita todos los valores de X y Y que satisfacen el predicado p/1.
    %Resultado:
    %    X = Y = 1.
    %    X = 1, Y = 2.
    %    X = 2, Y = 1.
    %    X = Y = 2.
    %Explicación:
    %    Prolog primero busca un valor para X que satisfaga p(X), que puede ser 1, 2 o 3.
    %    Luego, busca un valor para Y que también satisfaga p(Y), con las mismas opciones que para X.
    %    Puntos de elección desechados:
    %        Para X, se descartan los valores de p(3) debido al corte en la segunda cláusula p(2):- !..
    %        Para Y, se descartan los valores de p(3) debido a que no se continúa con la tercera cláusula después de la primera elección de X.

    %Preguntar por la 3era.