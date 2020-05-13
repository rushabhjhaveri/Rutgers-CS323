function cubicspline(file)

fileID = fopen(file, 'r'); 

formatspec = '%f';

A = fscanf(fileID, formatspec);

len = length(A);

num_points = A(1); 

points = 1:num_points*2; 

j = 1;

for i=2:len
    points(j) = A(i);
    j = j + 1;
end

P = zeros(num_points, num_points);

x = 1:num_points; 

y = 1:num_points;

s = 1;

t = 1;

for i = 1:(num_points*2)
    if(rem(i,2)==0)
        y(t) = points(i);
        t = t + 1;
    else
        x(s) = points(i);
        s = s + 1;
    end
end

h = 1:(num_points-1);
for i=1:(num_points-1)
    h(i)=x(i+1)-x(i);
end

for i = 1:num_points
    if(i==1)
        P(i,i) = 1;
        P(i+1,i) = 1;
    elseif(i==num_points)
        P(i,i) = 1;
        P(i-1,i) = 1;
    else
        P(i,i) = 2*(h(i-1)+h(i));
        if(i==num_points-1)
            P(i,i+1) = 1;
        else
            P(i+1,i) = 1;
            P(i,i+1) = 1;
        end
    end
end

a = y; 

B = [1:num_points]';

for i=1:num_points-1
    if(i==1||i==6)
        B(i)=0;
    else
        B(i)=((3/h(i))*(a(i+1)-a(i)))-((3/h(i-1))*(a(i)-a(i-1)));
    end
end

c = P \ B; 

d = 1:num_points-1; 

for i=1:num_points-1
    d(i)=(1/3*h(i))*(c(i+1)-c(i));
end

b=1:num_points-1;

for i=1:num_points-1
    b(i)=((a(i+1)-a(i))/(h(i)))-((((2*(c(i)))+(c(i+1)))/(3))*h(i));
end

S = zeros(num_points-1,num_points-2);

for i=1:num_points-1
    S(i,1)=a(i);
    S(i,2)=b(i);
    S(i,3)=c(i);
    S(i,4)=d(i);
end

disp(S);
xx=[x(1):h:x(num_points)];
yy=spline(x,y,xx);
plot(x,y,"x",xx,yy);


end