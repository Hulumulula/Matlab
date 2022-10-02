clc, clear, close all
Z=load('vA.csv');
X=load('zA.csv');
figure('Name','Графики');
ax1 = subplot(2,1,1);
H1=plot(Z,X);