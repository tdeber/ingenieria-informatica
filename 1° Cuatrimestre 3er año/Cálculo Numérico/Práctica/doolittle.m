function A = doolittle (A)

  n = length(A);

 for i=1:n-1
    for j=i+1:n
      m = A(j,i)/A(i,i);
      A(j,i)=m;

      for k = i+1:n
        A(j,k) = A(j,k) - m*A(i,k);
      endfor

    endfor
  endfor


endfunction
