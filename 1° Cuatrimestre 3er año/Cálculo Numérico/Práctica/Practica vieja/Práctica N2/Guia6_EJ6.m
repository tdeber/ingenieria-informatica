x = [0 1 2 3 4];              % No equiespaciados
y = x.^2;                     % f(x) = x^2
I = trapcomp(x, y);

x2 = [0 1 2 3 4];              % No equiespaciados
y2 = x.^2;
I2 = simpsoncomp(x2,y2);
