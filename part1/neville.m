% Open the file for reading, and obtain the file identifier, fileID.
fileID = fopen('neville_input.txt','r');

% Define the format of the data to read. Use '%f' to specify floating-point numbers.
formatspec = '%f';

% Read the file data, filling output array A in column order. 
A = fscanf(fileID, formatspec);

fclose(fileID);

% DEBUG: see if A populated correctly. 
% A = A';
disp(A);

len = length(A);

n = A(1); 

x0 = A(len);

fprintf('n: %d\n', n); 

fprintf('x0: %f\n', x0); 

x = zeros();
y = zeros();

idx1 = 1;
idx2 = 1; 

for i = 2:(len-1)
    b = mod(i,2);
    if b == 0
        x(idx1) = A(i);
        idx1 = idx1 + 1;
    elseif b == 1
        y(idx2) = A(i);
        idx2 = idx2 + 1;
    end
end

disp(x);
disp(y);

polynomial_degree = length(x)-1;

p = zeros(polynomial_degree+1, polynomial_degree+1);

for i = 1:length(x)
    p(i,i)=y(i);
end

for j = 1:(polynomial_degree+1)
    for i = 1:(polynomial_degree+1-j)
        p(i,i+j) = ((x(i+j)-x0)*p(i,i+j-1) + (x0-x(i))*p(i+1,i+j))/(x(i+j)-x(i));
    end
end

p = p(1, polynomial_degree+1);

fprintf('p: %f\n', p);





