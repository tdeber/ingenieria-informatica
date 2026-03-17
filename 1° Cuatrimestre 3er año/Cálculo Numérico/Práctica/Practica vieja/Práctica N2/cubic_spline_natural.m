function [a, b, c, d] = cubic_spline_natural(x,f)
  y=f;
# tanto x como y lo paso como un arreglo filas:
  n = length(x); %numero de puntos

  # inicializamos matriz A y vector lado derecho z
  A = zeros(n,n);
  z = zeros(n,1);

 # h(j) = x(j+1)-x(j)
  h = [x(2:n) - x(1:n-1)]'; # lo exprese como vector columna

  # Matriz A del sistema A*c = z, que calcula c
  # Separar por las condiciones de contorno

  # En Aup formo la diagonal Superior
  Aup=A;

  #IMPORTANTE -> recordar que la primer y ultima fila son puros 0 (no todos)
  #por la condicion de contorno

  # DIAGONAL PRINCIPAL
  dp = ones(n,1); %-> Para valores extremos: valor 1 (condicion natural)
  dp(2:n-1) = 2*(h(1:n-2) + h(2:n-1)); # puntos interiores : 2(h_j-1+h_j)

  # DIAGONAL INFERIOR
  A(2:n-1,1:n-2) = diag(h(1:n-2)); %-> A2,1 = h_1 (col)

  # diagonal Superior
  Aup(2:n-1,3:n)= diag(h(2:n-1));%-> A_2,3 = h_2 (fila)

  # Armo la matriz A con los datos de arriba
  A = A + Aup + diag(dp);

  #A = diag([1,2*(h(1:n-2) + h(2:n-1)),1]) + diag([h(1:n-2),0],-1) + diag([0,h(2:n-1)],1);

  # puntos interiores
  z(2:n-1) = 3*[((y(3:n) - y(2:n-1))'./h(2:n-1) - (y(2:n-1) - y(1:n-2))'./h(1:n-2))];
  # De acuerdo con las condiciones de contorno naturales
  z(1) = 0; # corresponde a la condicion de la frontera de x0 es decir la de la izquierda.
  z(n) = 0; # corresponde a la condicion de la frontera de xn es decir la de la derecha.

  # Calculamos los coeficientes c
  c=A\z; # Usamos el metodo directo de Octave.

  # Calculamos los coeficientes d
  d = (c(2:n) - c(1:n-1))./(3 * h(1:n-1));
  # Calculamos los coeficientes b
  b = ((y(2:n) - y(1:n-1))'./h(1:n-1)) - h(1:n-1).*(c(2:n) + 2*c(1:n-1))/3;
  # S(Xj) = f(Xj) = a(j)
  a = y(1:n-1)';
  # Defino c
  c = c(1:n-1);
 endfunction

