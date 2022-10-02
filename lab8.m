clear,clc,close all;

fig = openfig('image.fig');
l = findobj(gca,'Type','Line');
set(l,'Linestyle','none','Marker','o');
xlabel('x');
ylabel('y');
x = l.XData;
y = l.YData;
t = 0:10:3000;
x1 = interp1(x,y,t,'pchip');
hold on;
fig2 = plot(t,x1,'r');
hold off;
figure('Name','New');
ax3 = axes('Position',[0.13 0.11 0.8 0.8]);
b = copyobj(fig2,ax3);
set(b, 'color', 'black');
c = copyobj(l,ax3);
set(c, 'color', 'black');
rectangle('Position',[1100 5.7 400 0.3],'Curvature',0.2)
grid on;
legend('Проинтерполированные данные','Исходные данные','location','northwest');
ax5 = axes('Position',[0.5 0.2 0.3 0.3],'box', 'on');
b2 = copyobj(fig2,ax5);
set(b2, 'color', 'black');
c2 = copyobj(l,ax5);
set(c2, 'color', 'black');
ax5.XLim = [1100 1500];
ax5.YLim = [5.7 6];

grid on;