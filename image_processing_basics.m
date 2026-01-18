clc;
clear all;
close all;


% Image Processing code
I = imread("car1.png"); % get image file
imshow(I); % showing the original color image
% color image is 3d array which is 2d array with 3layers
Ig = rgb2gray(I); % Convert the RGB color image to grayscale
imshow(Ig); % Display the grayscale version

I_red = I; % Create a copy of the original image for color isolation
I_red(:,:,2:3) = 0; % Remove green and blue lyaers to isolate red
imshow(I_red); % display the red-only image

bnw = Ig > 120; % apply a binary threshold to create a black and white image
imshow(bnw); % display the binary result

I_eq = histeq(Ig); % Perform histogram equalization to enhance contrast
imshow(I_eq); % Display the contrast-enhanced grayscale image