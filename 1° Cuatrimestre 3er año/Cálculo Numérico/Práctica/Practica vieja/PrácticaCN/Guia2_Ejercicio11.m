A = [0 2 3; 2 -4 7; 1 -2 5];

##A_sp = doolittle(A)
##L1 = tril(A_sp,-1) + eye(1);
##U1 = triu(A_sp);

[Ar, r] = doolitle_p(A)

n = size(A, 1);
P = eye(length(r))(r, :);
  C = P*Ar;
  L = eye(n)+tril(C,-1);
  U = triu(C);

LU = L*U;
PA = P*A;

##D1 = A-(L1*U1);
##D2= (P*A)-(L2*U2);

#{
La diferencia entre ambas se debe a que, al realizar la factorizacion
sin pivoteo, se divide por un numero muy pequeño, lo cual genera errores
numericos y una acumnulacion de los mismos. En cambio, con pivoteo, se reordenan
las filas para evitar divisiones inestables.


#}

