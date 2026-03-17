entrada([empanada,sopa,pastelito]).
principal([pollo, asado, locro]).
postre([helado, fruta, chocolate]).

carta(X,Y,Z):-
          entrada(Entradas),
          member(X, Entradas),
          principal(Principales),
          member(Y, Principales),
          postre(Postres),
          member(Z, Postres).
