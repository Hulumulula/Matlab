clc,clear;
format long;
n = 180;
alpha = 0.5;
A = sprandsym(n, alpha);
B = ones(n,1);
disp('�������� �������: ');
disp(A);
disp('������� B: ');
disp(B);

tic;
disp('����� ����������� �������: ');
X1 = mldivide(A,B);
disp(X1);

disp('����� LU ����������: ');
[L,U]= lu(A);
y = L\B;
X2 = U\y;
disp(X2);

disp('����� QR ����������: ');
[Q,R] = qr(A);
X3 = R\(Q'*B);
disp(X3);
t1 = toc;

A1 = full(A);
disp('������ �������: ');
disp(A1);

tic;
disp('����� ����������� �������: ');
X4 = A1\B;
disp(X4);

disp('����� linsolve: ');
X5 = linsolve(A1,B);
disp(X5);

disp('����� LU ����������: ');
[L,U] = lu(A1);
y = L\B;
X6 = U\y;
disp(X6);

disp('����� QR ����������: ');
[Q,R] = qr(A1);
X7 = R\(Q'*B);
disp(X7);
t2 = toc;

disp('����� ������,���������� ����������� ��������: ');
q1 = whos('A');
disp('����� ������,���������� ������ ��������: ')
q2 = whos('A1');
disp('����� ���������� � ����������� ��������: ');
disp(t1);
disp('����� ���������� � ������ ��������: ');
disp(t2);

format short;
time = clock;

Klimov_LabRabota6 = fopen('Klimov_LabRabota6.txt','w');

if(Klimov_LabRabota6 == -1 ) 
    error( 'File is not opened.' ) 
end 

fprintf(Klimov_LabRabota6,'\t������������ ������ �6  \n\t�������� ������� ������ 1-���-2 ������ ��������� \n\t%d.%d.%d � %d ����� %d ����� %d ������ \n���������� ������� � �������� = %d ��� \n������� A1 �������� = %d\n����� ��������� ��������� ������� A =%d\n����� ������� ��������� ������� A =%d\n����� ������� � ������ �������� =%d\n����� ������� � ���������� �������� =%d\n',time,q1.bytes,q2.bytes,nnz(A),n^2-nnz(A),t1,t2);
fclose (Klimov_LabRabota6);
format shortg;
type Klimov_LabRabota6.txt
