ruta(santafe, parana).
ruta(parana, corrientes).
ruta(santafe, cordoba).
ruta(santafe, coronda).
ruta(santafe, rosario).
ruta(rosario, capital).
ruta(rosario, mardelplata).
ruta(capital, cordoba).
ruta(cordoba, parana).

hay_ruta(A, B):- ruta(A, B) ; ruta(B, A), A\=B.
combinacion(A, B) :- ruta(A, C), ruta(C, B).

%¿Desde que orígenes se llega a Córdoba?
%ruta(X, cordoba).

%¿Que destinos son alcanzados desde Paraná?
%ruta(parana, Y).

%¿Hay alguna ruta entre Paraná y Córdoba?
%hay_ruta(cordoba, parana).

% ¿Hay alguna combinación de dos rutas que permita ir desde Santa Fe a Corriente?
% combinacion(santafe, corrientes).
