%George Lees Jr
%bisection method
clear,clc;
i=1;

fprintf('\n** Bisection Method **\n');
fprintf('Enter the function after @(x) \n');%using anonymous function datatype
input0= input('f = @(x)...\n f = ');
f = input0;
ezplot(f, [-50,50,-10,10])
grid
input0= input('Please enter the negative bound = ');%look at graph and see where the 
a = input0;                                         %function is negative and positive
input0= input('Please enter the positive bound = ');
b = input0;
input0= input('Please enter the tolerance = ');
tol = input0;
input0= input('Please enter the maximum number of iterations = ');
Max_i = input0;                                     %convert to symbol so i can
equation=sym(f);                                    %use built in functions
g=solve(equation);
fprintf('\n***The solve functions answer to compare with is %s \n',char(g));%have to convert to char for printing
array1=zeros(100,3);


eq=(a+b)/2;

if f(a)*f(b)>0
     fprintf('\n** You need to pick two inputs for the function one being negative and the other positive **\n');
else
     while (abs(a-b)>= tol && i<Max_i)%do until the tolerance or
                                      %max amount of iterations is achieved
        eq=(a+b)/2;
                                    
           if f(a)*f(eq)<0             
                b=eq;
           else
                a=eq;
           end
           array1(i,1)=a;
           array1(i,2)=b;
           array1(i,3)=eq;
           
           
           i=i+1;
           
     end
     
     fprintf('\n***The root for f between the two values is %d \n',eq);
fprintf('\n***The number of iterations is %d \n',i-1);
disp('      a           b     halfwaypoint')
disp(array1)
end
               
            
            
            
            
            
            
            
    