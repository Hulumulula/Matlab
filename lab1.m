clear, clc
format compact
disp ('Задание 1 (Вариант 6)')

k = -2;
a = 3.5;
b = 0.35;
x = 1.523;

y = 10^4*a*x/b^2-abs((a-b)/k/x)+log(3)/(a*x+b^2)^(1/3)-exp(-k*x);

disp('y = ')
disp(y)