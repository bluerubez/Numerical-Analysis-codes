%George Lees Jr
%Fixed point iteration



i=1;
format long;

%declare anonymous function

fprintf('\n Fixed point iteration \n');
fprintf('Enter the function after @(x) for correct syntax \n');
input0=input('f = @(x)...\n f = ');%accept input
f = input0;%set input equal to function
input0=input('Enter initial condition for x:');
Xo = input0;
input0=input('Enter the tolerance:');
tol = input0;
input0 = input('Enter maximum amount of iterations:');
Max_i=input0;
array1=zeros(100,3);


    while i<=Max_i
        x = f(Xo);  %this is the condition 
                    %for fixed point iteration
        if abs(x-Xo) < tol
            fprintf('\n The fixed point is %g \n',Xo);
            break
        end
        
        i=i+1;
        array1(i,1)=Xo;
        array1(i,2)=x;
        array1(i,3)=abs(x-Xo);
        Xo=x;
    end
    
    fprintf('The number of iterations is %g \n',i-1);
    disp('      a           b        abs(x-Xo)')
disp(array1)
    