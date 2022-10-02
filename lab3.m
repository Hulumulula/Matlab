clc, clear;
m = input('¬ведите количество строк матрицы = ');
n = input('¬ведите количество столбцов матрицы = ');
B = [1 0;0 1];
A = [];
for i=1:m
   A = cat(2,A,B);
end 
C = A;
for j=1:n-1
   A = cat(1,A,C);
end 
disp(A);