  N = 41;
  h = 1 / (N - 1);
  x = linspace(0, 1, N);
  u0 = 5;
  u1 = 6;

  A = zeros(N-2, N-2);
  b = zeros(N-2, 1);

  for j = 1:(N-2)
    xj=x(j);
    b(j) = (h^2)*(20)*e^(-10*(xj-0.7)^2);
  endfor

  # Agregamos condiciones de borde
  b(1) += u0;
  b(end) += u1;

  for i = 1:(N-2)
    A(i,i) = 2;
    if i > 1
      A(i, i-1) = -1;
    endif
    if i < N-2
      A(i, i+1) = -1;
    endif
  endfor

x0 = zeros(N-2,1);
[rta,it,r] = gaussseidel(A,b,x0,5000,10^(-6));

