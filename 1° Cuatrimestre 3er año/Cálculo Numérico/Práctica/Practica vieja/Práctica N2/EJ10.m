t = [4 8 12 16 20 24];
c = [1590 1320 1000 900 650 560];

#c(t) = be^(-kt)
# ln(c) = -k*t + ln(b)
# cN = A*t + B -> z = ln(c) , A = -k ,B = ln(b)

cN = polyfit(t, log(c),1);

A = cN(1);
B = exp(cN(2));

f = @(t) B*exp(A*t);

#B

t_vals=linspace(0,30,100);
plot(t, c, 'ko', 'MarkerFaceColor', 'k'); hold on;
plot(t_vals, f(t_vals),'t--');

