clear, clc
format compact
disp('������� 3 (������� 6)')

m = input('������� ���������� ����� ������� m = ');
n = input('������� ���������� �������� ������� n = ');
A = [];

B = [[1 0];
     [0 1]];


for j=1:1:n
    A = cat(2,A,B);
end 

C = A;

for i=1:1:m
    A = cat(1,A,C);
end 
 
 disp(A)
     