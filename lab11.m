clc, clear all;

x = -2*pi:pi/10:2*pi;
y = -2*pi:pi/10:2*pi;
[t,h] = meshgrid(x,y);
z1 = F1(t,h);
z2 = F2(t,h);
x0 = 0.2;
y0 = 0.4;

%Трёхмерная сетчатая поверхность

figure;
mesh(h,t,z1,'EdgeColor',[1, 0.5, 0.5]);
hold on
mesh(t,h,z2,'EdgeColor',[0.5, 1, 0]);
line(Phi1(x,y),y,zeros(1,length(x)),'LineWidth',3,'Color',[1 0 0]);
line(Phi2(x,y),y,zeros(1,length(x)),'LineWidth',3,'Color',[0 1 0]);
hold off
xlabel('x'); ylabel('y'); zlabel('z');
legend('F_1(x,y)','F_2(x,y)','Orientation','horizontal','Location','Best');

%Изображение линий уровня для трехмерной поверхности

figure;
[C,h1] = contour(t,h,z1,'r','ShowText','on');
grid
hold on
[C,h2] = contour(t,h,z2,'r','ShowText','on');
hold off
xlabel('x'); ylabel('y');

X = [x0; y0];
J(1) = norm(Jacobian(X(1,1),X(2,1)));
X(:,2) = [Phi1(X(1,1),X(2,1)); Phi2(X(1,1),X(2,1))];
J(2) = norm(Jacobian(X(1,2),X(2,2)));
k = 2;
eps = 10 ^(-8);

while norm(X(:,k) - X(:,k-1))/norm(X(:,k))>eps
    X(:,k+1) = [Phi2(X(1,k), X(2,k)); Phi1(X(1,k), X(2,k))];
    J(k+1) = norm(Jacobian(X(1,k+1),X(2,k+1)));
    k = k + 1;
end 

disp('Решение системы методом Зейделя: ');
disp(X(:,k-1));


figure('Name','Найденное решение');
plot(X'); grid;
legend('x', 'y');
xlabel('Номер итерации');ylabel('x, y', 'Rotation', 0);

%Начальные функции
function f = F1(x,y)
    f = sin(x + 1) - y - 1; 
end

function f = F2(x,y)
    f = 2*x + cos(y) - 2; 
end

%Приводим к виду X_i = Phi_i(x,y)
function f = Phi1(x,y)
    f = sin(x + 1) - 1;
end

function f = Phi2(x,y)
    f = 1 - cos(y)/2 ;
end

%Первые производные
function f = dPhi1_dx(x,y)
    f = cos(x + 1);
end

function f = dPhi2_dy(x,y)
    f = sin(y)/2;
end

%Матрица Якоби
function f = Jacobian(x,y)
    f = [0 dPhi1_dx(x,y); dPhi2_dy(x,y) 0];
end
