function [c] = dif_div(x,y)

  n = length(x);
  D = zeros(n,n);

  %Primera columna: valores de y_i = f(x_i)
  D(:,1) = transpose(y(:));

  %Lleno la tabla de dif divididas

    for j=2:n
      for i=j:n
        D(i,j) = (D(i,j-1) - D(i-1,j-1)) / (x(i) - x(i-j+1));
      endfor
    endfor
  % Los coeficientes del polinomio son la diagonal superior (última fila de cada columna)
  c = diag(D);

endfunction

%Basicamente se trata de hacer la misma tabla de dif divergence
% xi f[x_i] f[x_i,x_i+1] f[x_i,x_i+1,x_i+2] ......
%      y_i


%El polinomio seria:
  %c(1) + c(2)*(x-x(1)) + c(3)*(x-x(2)) + c(4)*(x-x(3))
