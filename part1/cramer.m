function cramer(file)

% Open the file for reading, and obtain the file identifier, fileID.
fileID=fopen(file,'r');

% Define the format of the data to read. Use '%f' to specify floating-point numbers.
formatspec = '%f';

% Read the file data, filling output array A in column order. 
A=fscanf(fileID, formatspec);

% Close file once done reading. 
fclose(fileID);

% n
n=A(1);

m=2;

% matrix
P=zeros(n,n);

% b vector
b=1:n;

% Populate matirx
for i=1:n;
    for j=1:n;
        P(i,j)=A(m);
        m=m+1;
    end
end

% populate b 
for i=1:n;
    b(i)=A(m);
    m=m+1;
end


solution=1:n;
disp("determinant A: "+det(P));

for i=1:n
    
    % Matrix(i)=Matrix;
    % replace column i with b
    % solution = det(Matrix(i)/det(A);
    C=P;
    C(:,i)=b;
    disp("determinant A"+i+": "+det(C));
    
    % Return solution. 
    solution(i)=det(C)/det(P);
end

% Print solution. 
for i=1:n
    disp("x"+i+" = "+solution(i));
end

end