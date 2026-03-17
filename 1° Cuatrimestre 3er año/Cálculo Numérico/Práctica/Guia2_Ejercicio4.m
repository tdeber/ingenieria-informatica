#Guia2-Ejercicio_4

A = [1 -1 2 -1 ; 0 2 -1 1;0 0 -1 -1;0 0 0 2];

b = [-8;6;-4;4];

A2 = transpose(A);

x1 = sust_atras(A,b);
x2 = sust_adelante(A2,b);

display(x2);
