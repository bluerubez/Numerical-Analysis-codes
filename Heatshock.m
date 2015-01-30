clear,clc;
format long;
t=0;
dt = 0.00025;
time = 2;
T_old = imread('tulipgray.jpg');

T_temp=double(T_old);
[m,n,k] = size(T_temp);

T_new = double(T_temp);
T_new=ind2gray(T_new,colormap);

while t < time
    for i = 2:1:m-1
        for j = 2:1:n-1
            T_new(i,j) = T_temp(i,j) + dt*(T_temp(i+1,j) -2*T_temp(i,j) + T_temp(i-1,j)) + dt*(T_temp(i,j+1)-2*T_temp(i,j) + T_temp(i,j-1));
        end
    end
   T_temp = T_new;
   t = t+dt;
   
end
figure
image(T_new)
colormap(gray(256))

dt = .00025;
t = 0;
format longg;
time = .004;


ux = T_temp;
uy = T_temp;
uxx = T_temp;
uyy = T_temp;
uxf = T_temp;
uxb = T_temp;
uyf = T_temp;
uyb = T_temp;

while t < time
    for i = 2:1:m-1
        for j = 2:1:n-1
            
            uxf(i,j) = T_temp(i+1,j) - T_temp(i,j);
            uxb(i,j) = T_temp(i,j) - T_temp(i-1,j);
            uyf(i,j) = T_temp(i,j+1) - T_temp(i,j);
            uyb(i,j) = T_temp(i,j) - T_temp(i,j-1);
            
            if uxf(i,j) * uxb(i,j) <= 0
               ux(i,j) = 0;
            end
            
            if uyf(i,j) * uyb(i,j) <= 0
               uy(i,j) = 0;
            end
            
            if uxf(i,j) * uxb(i,j) > 0
               ux = min(uxf(i,j)),min(uxb(i,j));
            end
            
            if uyf(i,j) * uyb(i,j) > 0
               uy = min(uyf(i,j)),min(uyb(i,j));
            end
            
            ux(i,j) = (T_temp(i+1,j) - T_temp(i-1,j))./2;
            uy(i,j) = (T_temp(i,j+1) - T_temp(i,j-1))./2;           
                       
            uxx(i,j) = T_temp(i+1,j) -2*T_temp(i,j) + T_temp(i-1,j);
            uyy(i,j) =  T_temp(i,j+1)-2*T_temp(i,j) + T_temp(i,j-1);
            
            T_new(i,j) = T_temp(i,j) - dt * (((ux(i,j)*ux(i,j) + uy(i,j)*uy(i,j))).^1/2  * (uxx(i,j) +uyy(i,j)));
     
        end
    end           
        
        T_temp=T_new;
        t = t+dt;
       
end
figure
image(T_new)
colormap(gray(256))

