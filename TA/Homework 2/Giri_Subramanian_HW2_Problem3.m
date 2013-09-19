clear;clc
T = -20:5:85;
V = 0:5:55;

for i = 1:length(T)+1
    if i == 1
        fprintf('       ');
    else
        fprintf('T = %3d ',T(i-1));
    end    
end
fprintf('\n')

%fprintf('8.3%f',header_row(:))
for i = 1:length(V)    
    table(i,:) = 35.7 + 0.6*T - 35.7*V(i)^0.16 + 0.43*(V(i)^0.16)*T;
    fprintf('V = %2d', V(i));
    fprintf('%8.3f',table(i,:))
    fprintf('\n')
end



