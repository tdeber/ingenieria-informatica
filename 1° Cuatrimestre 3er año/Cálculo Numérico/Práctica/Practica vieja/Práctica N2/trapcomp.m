function I = trapcomp (x, y)

  n = length(x);
  I = 0;
  for i=2:n
    I = I + (x(i)-x(i-1))*(y(i)+y(i-1));
  endfor

    I *= 0.5;

endfunction
