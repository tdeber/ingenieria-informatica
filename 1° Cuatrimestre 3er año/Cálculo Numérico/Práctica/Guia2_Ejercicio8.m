
A = [2 -3 5;6 -1 3;-4 1 -2];

b = transpose([1 2 3]);

A_sp = doolittle(A);

L1 = tril(A_sp,-1) + eye(3); %parte inf + matriz identidad
U1 = triu(A_sp); %parte superior

%Solucion sin Pivoteo
%Ly = b
%Ux = y

y1 = sust_adelante(L1,b);
x1 = sust_atras(U1,y1);
##
##%Solucion con Pivoteo
##%Ly=Pb
##%Ux=y
##
[L2, U2, A_cp, r, P] = doolitle_p(A)

Pb = P*b;
y2 = sust_adelante(L2,Pb);
x2= sust_atras(U2, y2);
