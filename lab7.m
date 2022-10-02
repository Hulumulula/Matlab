clc,clear;
x = (1:0.1:20);
y1 = x-x.^0.5+1./8;
y2 = x+x.^0.5-1;
y3 = log(x) ./ (1 + x.^ 2);
y4 = log(2 .* x)./ (1 + 4 .* x.^ 2);
y5 = log(3 .* x) ./ (1 + 9 .* x.^ 2);
[xx, yy] = meshgrid(-1:0.05:1, -1:0.05:1);
z = 1.2 * xx.^ 2 + 2 * yy.^ 2 + 2 * xx - yy + 0.1;

subplot(4,4,1);
plot(x,y1);
grid on;
xlabel('x');
ylabel('y');
title('График первой функции');
hold on;

subplot(4,4,2);
plot(x,y2);
xlabel('x');
grid on;
ylabel('y');
title('График второй функций');
hold on;

subplot(4,4,3);
plot(x,y1,'-.',x,y2,'-x');
grid on;
xlabel('x');
ylabel('y');
title('График двух функций');
hold on;

subplot(4,4,5);
plot(x,y3);
grid on;
xlabel('x');
ylabel('y');
title('График функции при параметре а=1');
hold on;

subplot(4,4,6);
plot(x,y4);
grid on;
xlabel('x');
ylabel('y');
title('График функции при параметре а=2');
hold on;

subplot(4,4,7);
plot(x,y5);
grid on;
xlabel('x');
ylabel('y');
title('График функции при параметре а=3');
hold on;

subplot(4,4,8);
plot(x,y3,'b',x,y4,'r',x,y5,'g');
grid on;
xlabel('x');
ylabel('y');
title('Графики функций при каждом из параметров');
hold on;

k=1;
for i=0:0.1:pi
   x1(k)=sin(3*i);
   x2(k)=cos(5*i);
   k=k+1;
end
subplot(4,4,9);
plot(x1,x2);
grid on;
title('График функции заданной параметрически');
hold on;

subplot(4,4,13);
surf(xx,yy,z);
grid on;
xlabel('x');
ylabel('y');
zlabel('z');
title('График поверхности');
hold on;

subplot(4,4,14);
contour(xx,yy,z);
grid on;
xlabel('x');
ylabel('y');
zlabel('z');
title('График линий уровня');
hold on;

subplot(4,4,10);
phi = 0:0.01:pi;
polarplot(phi, sin(phi).^2.*cos(phi));
grid on;
title('График функции, заданной в полярной системе координат');
hold on;

subplot(4,4,11);
phi = 0:0.01:pi;
[xxx,yyy] = pol2cart(phi,sin(phi).^2.*cos(phi));
plot(xxx,yyy);
axis equal;
grid on;
title('Декартовы координаты');
hold on;