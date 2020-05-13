function leastsquares(file)

fileID = fopen(file, 'r');

formatspec = '%f';

A = fscanf(fileID, formatspec); 

fclose(fileID); 

len = length (A);

num_points = A(1); 

polynomial_degree = A(2);

points = 1:num_points*2;

x = 1:num_points;

y = 1:num_points;

a = 1; 

t = 1;

j = 1;

P = zeros(polynomial_degree+1, polynomial_degree+1);

b = [1:polynomial_degree+1]';

for i = 3:len
    points(j) = A(i);
    j = j + 1;
end

for i = 1: (2*num_points)
    if rem(i,2) == 0
        y(t) = points(i); 
        t = t + 1;
    else
        x(a) = points(i); 
        a = a + 1;
    end
end

for i= 1:polynomial_degree+1
    b(i)=sum(y.*(x.^(i-1)));
    for j = 1:polynomial_degree+1
        if(i == 1 && j == 1)
            P(i,j)= num_points;
        elseif(i == polynomial_degree+1 && j== polynomial_degree+1)
            P(i,j)=sum(x.^(2*polynomial_degree));
        else
            P(i,j)=sum(x.^(i-1+j-1));
        end
    end
end

C = P \ b;

c = C';

disp(c);

xx = [x(1):0.1:x(num_points)];

yy = 0;

for i = 1:polynomial_degree+1
   yy = yy + (C(i)*xx.^(i-1));
end

plot(xx,yy,x,y,"x");

end