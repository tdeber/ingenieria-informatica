function A = gauss (A, b)
  n = length(b);
  A = [A b];
  for i=1:n-1

    for j=i+1:n

      m = A(j,i)/A(i,i);

      A(j,:) = A(j,:) - m*A(i,:);


    endfor
  endfor
endfunction
