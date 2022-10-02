clc,clear;
format long;
n = 180;
alpha = 0.5;
A = sprandsym(n, alpha);
B = ones(n,1);
disp('Исходная матрица: ');
disp(A);
disp('Столбец B: ');
disp(B);

tic;
disp('Через стандартную функцию: ');
X1 = mldivide(A,B);
disp(X1);

disp('Через LU разложение: ');
[L,U]= lu(A);
y = L\B;
X2 = U\y;
disp(X2);

disp('Через QR разложение: ');
[Q,R] = qr(A);
X3 = R\(Q'*B);
disp(X3);
t1 = toc;

A1 = full(A);
disp('Полная матрица: ');
disp(A1);

tic;
disp('Через стандартную функцию: ');
X4 = A1\B;
disp(X4);

disp('Через linsolve: ');
X5 = linsolve(A1,B);
disp(X5);

disp('Через LU разложение: ');
[L,U] = lu(A1);
y = L\B;
X6 = U\y;
disp(X6);

disp('Через QR разложение: ');
[Q,R] = qr(A1);
X7 = R\(Q'*B);
disp(X7);
t2 = toc;

disp('Объем памяти,занимаемый разреженной матрицей: ');
q1 = whos('A');
disp('Объем памяти,занимаемый полной матрицей: ')
q2 = whos('A1');
disp('Время выполнения с разреженной матрицей: ');
disp(t1);
disp('Время выполнения с полной матрицей: ');
disp(t2);

format short;
time = clock;

Klimov_LabRabota6 = fopen('Klimov_LabRabota6.txt','w');

if(Klimov_LabRabota6 == -1 ) 
    error( 'File is not opened.' ) 
end 

fprintf(Klimov_LabRabota6,'\tЛабораторная работа №6  \n\tВыполнил студент группы 1-ПМИ-2 Климов Александр \n\t%d.%d.%d в %d часов %d минут %d секунд \nРазреженая матрица А занимает = %d бит \nМатрица A1 занимает = %d\nЧисло ненулевых элементов матрицы A =%d\nЧисло нулевых элементов матрицы A =%d\nВремя решения с полной матрицей =%d\nВремя решения с разреженой матрицей =%d\n',time,q1.bytes,q2.bytes,nnz(A),n^2-nnz(A),t1,t2);
fclose (Klimov_LabRabota6);
format shortg;
type Klimov_LabRabota6.txt
