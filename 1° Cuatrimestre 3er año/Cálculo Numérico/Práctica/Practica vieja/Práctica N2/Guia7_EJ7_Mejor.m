%Ejercicio 7

f = @(t,x) ([-t*x(2);t*x(1)-t*x(2)]);
int = [0,20];
h = 0.05;
L = 400; #-> h = (b-a)/L
x0 = [1;-1];

[t,x] = euler(f,int,x0,L);

plot(x(:,1),x(:,2),"linewidth",2);
grid on; grid minor;

%Rapidez de la particula en t=3;

i = find(t>=3,1); #Indice mas cercano a t=3
dx1 = -3*x(i,2);
dx2 = 3*x(i,1)-3*x(i,2);

v = [dx1,dx2];

rapidez = norm(v);

%Posicion de la particula en t=3;

Pos = [x(i,1),x(i,2)]; #o x(i,:);

%Instante de tiempo a partir del cual todos los puntos
%tienen una distancia al origen menor a 0.01

dist = sqrt(x(:,1).^2 + x(:,2).^2);
for i = 1:length(t)
    if (dist(i) < 0.01)
        printf("Todos los puntos desde t=%.2f tienen distancia < 0.01\n", t(i));
        break;
    end
end




