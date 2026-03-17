% Definición de las entradas, platos principales y postres como listas
entradas(['ensalada', 'sopa', 'empanada']).
principales(['pasta', 'pollo', 'pescado']).
postres(['flan', 'helado', 'alfajor']).

% Predicado carta/3 que combina entradas, platos principales y postres
carta(Entrada, Principal, Postre) :-
    entradas(Entradas),
    member(Entrada, Entradas),
    principales(Principales),
    member(Principal, Principales),
    postres(Postres),
    member(Postre, Postres).


hombre(['tomas', 'emiliano']).

es_hombre(X):- hombre(Hombres), member(X, Hombres).

%entrada(ensalda).
%entrada(sopa).
%entrada(empanada).

%principal(pasta).
%principal(pollo).
%principal(pescado).

%postre(flan).
%postre(helado).
%postre(alfajor).

%carta(Entrada, Principal, Postre):-
%  entrada(Entrada),
%  principal(Principal),
%  postre(Postre).

