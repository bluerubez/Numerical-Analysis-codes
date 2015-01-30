%George Lees Jr.
%Newtons Method



clc,clear;

i=1;

fprintf('\n** Newtons Method **\n');        %OKKK start with anonymous function
fprintf('Enter the function after @(x) \n');
input0= input('f = @(x)...\n f = ');
f = input0;
ezplot(f, [-50,50,-10,10])
grid
input0= input('Please enter the initial condition = ');%have to cast Xo down below
Xo = input0;
input0= input('Please enter the tolerance = ');
tol = input0;
input0= input('Please enter the maximum number of iterations = ');
Max_i = input0;
f=sym(f);                                   %In order to use diff function
g=diff(f);                                  %had to convert anonymous function
f=matlabFunction(f);                        %to symbolic type
g=matlabFunction(g);                        %then had to convert it back so 
Xo=double(Xo);                              %i could pass Xo into the function call
array1=zeros(100,3);



 while i<=Max_i
    
  
    x = Xo-(f(Xo)/g(Xo));                   %so know Xo is a number going into the function call
    
    
    if abs(x-Xo) < tol                      %this is why abs didn't work bc doesnt except sym
       fprintf('\n***The root for f is %g \n',Xo);
       break
    end
        i=i+1;
        array1(i,1)=Xo;
        array1(i,2)=x;
        array1(i,3)=abs(x-Xo);
        Xo=x;                               %have to set them equal after so it can step right
 end
    
 
fprintf('***The number of iterations is %g \n',i-1);
 disp('          a               b                abs(x-Xo)')
disp(array1)
    

