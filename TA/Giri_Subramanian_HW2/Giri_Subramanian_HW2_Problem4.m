
error = input('Please input the allowable error: ');

n = 1;
diff = exp(-1) - (1 - n^(-1))^n;

while diff > error
    n = n+1;
    diff = exp(-1) - (1 - n^(-1))^n;
end

fprintf('The minimum n required is %d and the value of the error is %d \n', n ,diff)

% Values of n required are given below for the respective errors
% 10^-4 = 1840
% 10^-6 = 183941
% 10^-8 = 17752387

% This is not a good way as very soon the time taken to compute it becomes
% very high and it is not efficient