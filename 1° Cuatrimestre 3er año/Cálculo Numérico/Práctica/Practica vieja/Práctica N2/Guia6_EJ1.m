f = @(x) exp(x) - 2*x.^2 + 3*x - 1;
fp_exacto = 4;  % f'(0)

h_vals = linspace(10^-11,10^-1);
errores = zeros(length(h_vals));

for i = 1:length(h_vals)
    h = h_vals(i);
    deriv_aprox = (f(0 + h) - f(0)) / h; % f'(x) = f(x+h)-f(x) / h
    errores(i) = abs(fp_exacto - deriv_aprox);
end

plot(h_vals, errores, 'r-o')
xlabel('h')
ylabel('Error absoluto')
title('Error de la derivada numérica con fórmula de 2 puntos')
grid on

#teoria
#Cuando h -> 0: el error de redondeo (1er término) crece; y el error
#de truncamiento (2do término), disminuye.


%El grafico se puede interpretar ignorando los errores = 0
%como que a medida que aumento h (la distancia entre los valores de x)
%el error va aumentando cada vez mas en la estimacion de la derivada
%de dos puntos progresiva

%y si el error de redonde se hace mas chico a medida que h disminuye
%porque la computadora no utiliza numeros muy chicos entonces
%a medida que uso numeros cada vez mas chicos ese error se va acumulando
%y aumentando.
