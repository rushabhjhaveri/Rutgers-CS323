fid = fopen('horner_input.txt','r');
inputs = fscanf(fid, '%f');
fclose(fid);

coeff = zeros();
n=inputs(1);
for i = 1:n+1
    coeff(i) = inputs(n+3-i);
end

newpoln = zeros();

result = coeff(1);
x0=inputs(length(inputs));

for i = 1:n+1
    for j = 1:length(coeff)-i
        if j == 1
            newpoln(1) = result;
        end
        result = result * x0 + coeff(j+1);
        newpoln(j+1) = result;
       
    end
       coeff = newpoln;
       result = newpoln(1);
   
end
newpoln = flip(newpoln);
for i=2:length(newpoln)
    newpoln(i)=newpoln(i)*factorial(i-1);
end
for i = 1:length(newpoln)
   
    if i == 1
        fprintf('P%d(x0)=%f\n',i,newpoln(i));
    else
         fprintf('P%d(x0)=%f\n',i,newpoln(i))
    end
   
end