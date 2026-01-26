%26/01/26
%created by ketan dayke
clc; clear; close all;

img = imread('cameraman.tif'); 
[rows, cols] = size(img);
sliced_images = zeros(rows, cols, 8); % Storage for 8 planes

for i = 1:8
    % Use bitget to extract the i-th bit from every pixel
    sliced_images(:,:,i) = bitget(img, i);
end

% Display MSB and a middle bit for comparison
subplot(1,2,1); imshow(logical(sliced_images(:,:,8))); title('MSB (Bit 7)');
subplot(1,2,2); imshow(logical(sliced_images(:,:,1))); title('LSB (Bit 0)');