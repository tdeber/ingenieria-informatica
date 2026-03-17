function [w] = wOptimo (A,b,x0,tolerancia,maxit)

  aux=100000;
  w=0.01;
  for i=0.1:0.1:2.0
    [x,it,r]=SOR(A,b,x0,maxit,tolerancia,i);
    if(it<aux)
      w=i;
      aux=it;
    endif
  endfor

  %tambien se puede usar la formula, si la matriz es definida positiva
  %y tridiagonal
  %w = 2/( 1+sqrt( 1 - (RadJacobi(A)^2) ) )

endfunction
