% Algorithm to execute Horner's Method for Polynomial Evaluation. 
% Author: Rushabh Jhaveri [rrj28]

% Read input from horner_input.txt. 

% Open the file for reading, and obtain the file identifier, fileID.
fileID = fopen('horner_input.txt','r');

% Define the format of the data to read. Use '%f' to specify floating-point numbers.
formatspec = '%f';

% Read the file data, filling output array A in column order. 
A = fscanf(fileID, formatspec);

fclose(fileID);

% DEBUG: see if A populated correctly. 
% A = A';
disp(A);

% Iterate over array [in preparation to begin assignments]. 
% for i = 1:length(A)
%     fprintf('Number at position %d = %f\n', i, A(i))
% end

% First index is the degree of the polynomial.
polynomial_degree = A(1);

% DEBUG: see if assignment worked correctly. 
fprintf('Degree of polynomial = %d\n', polynomial_degree);

% Set the value of N (why haven't I done this yet...lol). 
N = length(A);

% DEBUG: see if assignment worked correctly. 
fprintf('Length of vector = %d\n', N);

a_i = zeros();

% DEBUG: see if vector initialized correctly. 
% disp(a_i);

for i = 1:polynomial_degree+1
    a_i(i) = A(n+3-i);
end

% DEBUG: see if coefficients vector populated correctly. 
disp(a_i);

x0 = A(N); 

% DEBUG: see if assignment worked correctly. 
fprintf('x0 = %f\n', x0);

new_polynomial = zeros();



result = a_i(1);

for i = 1:(polynomial_degree+1)
    for j = 1: (length(a_i)-i)
        if j == 1
            new_polynomial(1) = result;
        end
        result = result * x0 + a_i(j+1);
        new_polynomial(j+1) = result;
    end
    a_i = new_polynomial;
    result = new_polynomial(1);
    
end

new_polynomial = flip (new_polynomial);

for i=2:length(new_polynomial);
    new_polynomial(i)= new_polynomial(i)* factorial(i-1);
end

for i = 1:length(new_polynomial)
    if i == 1
        fprintf('P%d(x0)=%f\n',i,new_polynomial(i));
    else
         fprintf('P%d(x0)=%f\n',i,new_polynomial(i));
    end
   
end


