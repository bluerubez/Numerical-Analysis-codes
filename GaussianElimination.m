%GaussianElimination 
clear,clc;

format long;
%Allow user to input A matrix
m = input('Enter number of rows for the coefficient matrix: '); 
n = input('Enter number of columns for the coefficient matrix: '); 

for column = 1:m 
for row = 1:n 
str = ['Enter element in row ' num2str(column) ', col ' num2str(row) ': ']; 
A(column,row) = input(str); 
end 
end 

%Allow user to b matrix
m = input('Enter number of rows for the coefficient matrix: '); 
for column = 1:m 
str = ['Enter element in row' ': ']; 
b(column,1) = input(str); 
end 

N = n;

for column = 1:n-1
    %Attempt at pivot
    for row = column+1:n %assumption that the both rows,i isnt zero also
        if abs(A(row,column)) > abs(A(column,column))
            U = A(column,:);
            A(column,:) = A(row,:);
            A(row,:) = U;        
        end
         % figure out coeff to do row operation with 
 d = A(row,column)/A(column,column); 
 %do the row operation 
 A(row,:) = A(row,:)-d*A(column,:);
 b(row) = b(row)-d*b(column);
    end
end 
 

%back substitution 
for row=N:-1:1 
x(row) = b(row); 
for column=(row+1):N 
 x(row) = x(row)-A(row,column)*x(column); 
end 
x(row) = x(row)/A(row,row); 
end 
%return the answer 
x = x';
return 
