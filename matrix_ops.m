clc;
close all;
clear all;


% Matrix Operations Code
A = zeros(4, 4); % Initialize a 4x4 matrix with zeros

for i=1:4 % Loop through each row
    for j=1:4 % Loop through each column
        A(i,j)=randi([0,10]); % Assign a random integer between 0 and 10 to each cell
    end
end

display(A); % Print the manually generated matrix
aa = randi([0,10],4,4); % get a 4x4 random matrix using a single  command
display(aa); % Print the vectorized matrix