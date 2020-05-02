% coefficients of a polynomial a0, a1, . . . , an, an 
% initial guess x0 ∈ R, 
% an error tolerance epsilon,
% maximum number of iterations N, 

% Open the file for reading, and obtain the file identifier, fileID.
fileID = fopen('newton_horner_input.txt','r');

% Define the format of the data to read. Use '%f' to specify floating-point numbers.
formatspec = '%f';

% Read the file data, filling output array A in column order. 
A = fscanf(fileID, formatspec);

fclose(fileID);

% DEBUG: see if A populated correctly. 
% A = A';
disp(A);

% First index is the degree of the polynomial.
polynomial_degree = A(1);

% DEBUG: see if assignment worked correctly. 
fprintf('Degree of polynomial = %d\n', polynomial_degree);

n = length(A);

N = A(n);

epsilon = A(n-1);

x0 = A(n-2);

a_i = zeros();

j=1;
for i = 2:(n-3)
    
    a_i(j) = A(i);
    j = j+1;
end

disp(a_i);

approx_root = x0; 

output = 0;

coelen = length(a_i);

flag = 0;

for j = 1:N
    b = a_i(coelen);
    c = a_i(coelen);
    i = coelen;
    while i > 2
        i = i-1;
        b = a_i(i) + b * approx_root; 
        c = b + c * approx_root;
    end 
    
    b = a_i(1) + b * approx_root;
    
    old_approx = approx_root;
    approx_root = approx_root - (b/c);
    
    if abs(approx_root - old_approx) < epsilon;
        output = approx_root;
        flag =1;
    end
end

if flag == 1
    fprintf('Root: %f\n', output);
else
    fprintf('Unable to find root.\n');
end



        