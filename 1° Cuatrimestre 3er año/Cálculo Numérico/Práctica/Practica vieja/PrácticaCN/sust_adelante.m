
function x = sust_adelante (A, b)
  n = length(b);
  x = zeros(n,1);


  for i=1:n
    if i==1
      x(i) = b(i)/A(i,i);
    else
      x(i) = (b(i) - A(i,1:i-1)*x(1:i-1)) /A(i,i);
    endif
  endfor



endfunction
