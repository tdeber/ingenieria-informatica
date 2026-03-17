#Etapa 1
t1 = [0 1 2]
x1 = [0 2 6];
y1 = [0 4 6];

dx0 = 0;
dy0 = 0;
dx2 = 0;
dy2 = 0;

[ax1,bx1,cx1,dx1] = cubic_spline_clamped(t1, x1, 0, 0);
[ay1,by1,cy1,dy1] = cubic_spline_clamped(t1, y1, 0, 0);

#Etapa 2
t2 = [2, 3, 4];
x2 = [6, 3, 0];
y2 = [6, 2, 0];

dx2 = 0;
dy2 = 0;
dx4 = 0;
dy4 = 0;

[ax2,bx2,cx2,dx2] = cubic_spline_clamped(t2, x2, 0, 0);
[ay2,by2,cy2,dy2] = cubic_spline_clamped(t2, y2, 0, 0);

t = linspace(1,4,1000);
x = zeros(length(t));
y = zeros(length(t));

#A



