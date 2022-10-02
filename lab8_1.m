clear,clc;
Z=load('vA.csv');
X=load('zA.csv');
fig=plot(X,Z,'b');
saveas(fig,'image.fig');