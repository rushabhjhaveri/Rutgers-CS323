function simpsons(file)

fileID = fopen(file, 'r'); 

formatspec1 = '%s'; 
formatspec2 = '%f'; 

text = fscanf(fileID, formatspec1, 1);

A = fscanf(fileID, formatspec2); 

fclose(fileID);

fx = text; 

a = A(1); 

b = A(2); 

num_intervals = A(3); 

h = (b-a)/num_intervals;

x = 1:num_intervals+1;

x(1) = a;

for i = 2:num_intervals+1
    x(i) = x(i-1) + h;
end

f = inline(fx); 

m = (num_intervals- 2)/2; 

evens = 1:m; 

odds = 1:m; 

s = 1; 

t = 1; 

for i = 2:num_intervals
    if(rem(i,2)== 0)
        odds(t) = feval(f,x(i));
        t = t + 1;
    else
        evens(s) = feval(f,x(i));
        s = s + 1;
    end
end

c = h/3; 

fx0 = feval(f,x(1));

sum_evens = sum(evens); 

sum_odds = sum(odds);

fxn = feval(f,x(num_intervals+1));

output = c * (fx0 + (2*sum_evens) + (4*sum_odds) + fxn);

disp(output);

end