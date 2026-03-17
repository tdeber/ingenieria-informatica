function x = gauss_v (A, b)

  n = length(b);
  for i=1:n-1

    for j=i+1:n

      m = A(j,i)/A(i,i);

      A(j,:) = A(j,:) - m*A(i,:);
      b(j) = b(j) - m*b(i);

    endfor
  endfor

   x=sust_atras(A,b);

endfunction
