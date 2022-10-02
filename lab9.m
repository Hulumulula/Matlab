clear,clc;
format long

%Интерполяция

x = [0 0.5 1 1.5 2];
y = [0.8807 1.0782 1.2218 1.8782 1.1601];
xi = 0:0.01:2;
px = 1.88;

f1 = interp1(x,y,xi,'nearest');
x1 = interp1(x,y,px,'nearest');
f2 = interp1(x,y,xi,'linear');
x2 = interp1(x,y,px,'linear');
f3 = interp1(x,y,xi,'spline');
x3 = interp1(x,y,px,'spline');

subplot(4,4,2);
plot(xi,f1,px,x1,'bsquare',x,y,'r*');
title('nearest');
subplot(4,4,3);
plot(xi,f2,px,x2,'bsquare',x,y,'r*');
title('linear')
subplot(4,4,4);
plot(xi,f3,px,x3,'bsquare',x,y,'r*');
title('spline');
subplot(4,4,1);
plot(x,y,'r*','linestyle' ,'none');
title('origin');

%Метод наименьших квадратов

ff1 = polyfit(x,y,1);
poly1 = polyval(ff1,0:0.1:2);
polyp1 = polyval(ff1,x);
yy1 = polyval(ff1,px);
subplot(4,4,5);
plot(0:0.1:2,poly1,x,y,'r*',px,yy1,'bsquare');
title('polyval 1')

ff2 = polyfit(x,y,2);
poly2 = polyval(ff2,0:0.1:2);
polyp2 = polyval(ff2,x);
yy2 = polyval(ff2,px);
subplot(4,4,6);
plot(0:0.1:2,poly2,x,y,'r*',px,yy2,'bsquare');
title('polyval 2')

ff3 = polyfit(x,y,3);
poly3 = polyval(ff3,0:0.1:2);
polyp3 = polyval(ff3,x);
yy3 = polyval(ff3,px);
subplot(4,4,7);
plot(0:0.1:2,poly3,x,y,'r*',px,yy3,'bsquare');
title('polyval 3');
dy21 = 0;
dy22 = 0;
dy23 = 0;

for i = 1:5
    dy21 = dy21+(y(i)-polyp1(i))^2;
    dy22 = dy22+(y(i)-polyp2(i))^2;
    dy23 = dy23+(y(i)-polyp3(i))^2;
end

disp("Погрешность для 1 степени:");
disp(dy21);
disp("Погрешность для 2 степени:");
disp(dy22);
disp("Погрешность для 3 степени:");
disp(dy23);

%Нелинейные уравнения

%Степень

p1 = [1 0 5,8 -23];
r1 = roots(p1);
polyy1 = polyval(p1,-5:5);
subplot(4,4,9);
plot(-5:5,polyy1,r1(3),0,'r*');
title('Полином 3 степени');

%Производная

dp1 = polyder(p1);
polydp1 = polyval(dp1,-5:5);
subplot(4,4,10);
plot(-5:5,polydp1);
title('производная');

%Трансцендентная

x4 = 0.1:0.01:1.3;
y10 = fzero(@f10,1);
yt = 2-x4-log(x4);
subplot(4,4,11);
plot(x4,yt,y10,0,'r*');
title('Трансцендентная');

%Метод трапеции
a = 0.8;
b = 2.0;

t = 0.8:0.1:2.0;
hz = (1 + t.^3).^0.5;
int1 = trapz(t,hz);
disp('Вычисление интеграла методом трапеций:')
disp(int1);

int2 = integral(@integ,a,b);
disp('Вычисление интеграла методом Cимпсона:')
disp(int2);


pin1 = (0.1/2)*(integ(a)+integ(b))+0.1*sum(integ(0.9:0.1:1.9));
disp('Проверка метода трапеций:')
disp(pin1);

pin2 = (0.1/3)*(integ(a)+integ(b)+4*sum(integ(0.9:0.2:1.9))+2*sum(integ(1:0.2:1.9)));
disp('Проверка метода Симпсона:')
disp(pin2);

%Интегралы

function yyy1 = integ(x5)
yyy1 = (1+x5.^3).^(0.5);
end

function y1 = f10(x4)
y1 = 2-x4-log(x4);
end