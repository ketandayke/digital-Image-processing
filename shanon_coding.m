%20/01/26
%created by ketan
%shanon coding code for compression
clc; clear;

symbols = {'A', 'B', 'C', 'D', 'E'};
p = [0.35, 0.17, 0.17, 0.16, 0.15]; % Must sum to 1

% 2. Sort Probabilities (Descending)
[p, idx] = sort(p, 'descend');
symbols = symbols(idx);

% 3. Calculate Cumulative Probabilities (F)
% Shannon uses the sum of previous probabilities
F = [0, cumsum(p(1:end-1))]; 

% 4. Generate Codes
fprintf('Symbol\t Prob\t Code\n');
for i = 1:length(p)
    % Length of code word
    L = ceil(-log2(p(i)));
    
    % Convert cumulative probability to binary
    code = '';
    tempF = F(i);
    for j = 1:L
        tempF = tempF * 2;
        if tempF >= 1
            code = [code '1'];
            tempF = tempF - 1;
        else
            code = [code '0'];
        end
    end
    fprintf('%s\t %.2f\t %s\n', symbols{i}, p(i), code);
end