#preg 3 compilado p2
#F=mg-cv ==> ma=mg-cv ==> mr''=mg-cr'
#llamemos y1=ry
#y1'=y2=ry'
#ry''=y2'= g - c/m * y2
#x1=rx
#x1'=x2=rx'
#x2'= -c/m * x2
g=9.81;
m=10;
c=0.2;
#llamemos x(1) y x(2) a la pos en x1 y en x2 respectivamente
#y x(3),x(4) las comp de la velocidad en x1 y en x2 respectivamente
f=@(t,x) [x(3); x(4); -(c/m)*x(3); -g-(c/m)*x(4)];
T1=0;
T2=3;
x0=[0,30,40,0];
%h=0.025;
%L=round((T2-T1)/0.025)
L=100;
[t,x]=rk4(f,[T1,T2],x0,L)
#grafico la pos vertical en el tiempo. me interesa saber mas o menos cuando llega a cero
plot(t,x(:,2)); hold on;
plot(t,zeros(length(t),1));
#la grafica me indica que llega entre t=2.48 y t=2.5
#interpolo con polyfit y busco el cero alrededor de la función con biseccion
p=polyfit(t,x(:,2),10);
pt=@(t) polyval(p,t);
[punto,h]=biseccion(pt,2.4,2.5,100,0.00001);
punto

T2=punto;
[t2,x2]=rk4(f,[T1,T2],x0,L);
x2(end,1)

#inciso b
[tb,xb]=rk4(f,[T1,2],x0,L);
y=sqrt(xb(:,3).^2 + xb(:,4).^2);
dist=simpsoncomp(tb,y)
