function x = sust_atras(A, b)

n = length(A);
x = zeros(n,1);
    for i = n:-1:1
      if i == n
        x(i) = b(i) / A(i,i);
    else
        x(i) = (b(i) - A(i,i+1:end) * x(i+1:end)) / A(i,i);
    endif
    endfor

endfunction

