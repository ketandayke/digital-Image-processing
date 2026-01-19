% This is code is to convert 8x8 matrix in equalized histogram matrix 
clc;
close all;
clear all;
% 8x8 image matrix
I = [52 55 61 59 79 61 76 61;
     62 59 55 104 94 85 59 71;
     63 65 66 113 144 104 63 72;
     64 70 70 126 154 109 71 69;
     67 73 68 106 122 88 68 68;
     68 79 60 70 77 66 58 75;
     69 85 64 58 55 61 65 83;
     70 87 69 68 65 73 78 90];
 
num_pixels=numel(I);
hist_counts=zeros(1,256);%hist intentsity vector to store freq of intensity
for i=1:num_pixels
    val=I(i);%getting element from matrix
    hist_counts(val+1)=hist_counts(val+1)+1;% using +1 b/s indexing starts from 
    %1 and intesity is from 0 to 255 total(256)
end

cdf=cumsum(hist_counts);% cdf(cummulative distributive function sum of freq
%Find CDF min (first non-zero value)
cdf_min=min(cdf(cdf>0));% finding min of all cdf values

% 4. Apply Equalization Formula: h(v) = round((cdf(v) - cdf_min) / (total - cdf_min) * 255)
L=256;%Intensity levels
equalized_I=zeros(size(I));
% size(matrix,1) give rows count and size(matrix,2) gives columns
for r=1:size(I,1)
    for c=1:size(I,2)
        v=I(r,c);
        equalized_I(r,c)=round((cdf(v+1)-cdf_min)/(num_pixels-cdf_min)*(L-1));
    end
    
end
disp('Original 8x8 Matrix:');
disp(I);
disp('historgram equzlized 8x8 matrix')
disp(equalized_I);

