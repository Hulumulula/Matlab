clear,clc;
x=[0,0.5,1,1.5,2];
y=[0.0824,1.0799,1.2235,1.0291,0.3618];
x0=0.67;    
f1=interp1(x,y,x0,'nearest');
f2=interp1(x,y,x0,'linear');
f3=interp1(x,y,x0,'spline');

