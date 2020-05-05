function horner(file)

% Open the file for reading, and obtain the file identifier, fileID.
fileID = fopen(file,'r');

% Define the format of the data to read. Use '%f' to specify floating-point numbers.
formatspec = '%f';

% Read the file data, filling output array A in column order. 
A = fscanf(fileID, formatspec);

% Close file scanner once done with file. 
fclose(fileID);

% Vector to store coefficients of polynomial. 
coeff = zeros();

% Stores degree of polynomial, n. 
n = A(1);

% Populate coefficients vector. 
for i = 1:n+1
    coeff(i) = A(n+3-i);
end

% Store the new polynomial after each iteration. 
newpolynomial = zeros();

result = coeff(1);

% Initial value we are working with. 
x0 = A(length(A));

% Computer derivatives using Horner's. 

for i = 1:n+1
    for j = 1:length(coeff)-i
        if j == 1
            newpolynomial(1) = result;
        end
        result = result * x0 + coeff(j+1);
        newpolynomial(j+1) = result;
       
    end
       coeff = newpolynomial;
       result = newpolynomial(1);
   
end
newpolynomial = flip(newpolynomial);
for i=2:length(newpolynomial)
    newpolynomial(i)=newpolynomial(i)*factorial(i-1);
end
for i = 1:length(newpolynomial)
   
    if i == 1
        fprintf('P%d(x0)=%f\n',i,newpolynomial(i));
    else
         fprintf('P%d(x0)=%f\n',i,newpolynomial(i))
    end
   
end

end

