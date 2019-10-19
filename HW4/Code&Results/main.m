close all;
clc;

I = imread('test.jpg');
tar = imread('target.jpg');

% histogram equalization
J = histogramEqualization(I);
figure(1);
imshow(J);
imwrite(J, 'resofhiseq.jpg', 'jpg');

% histogram match
K = histogramMatch(I, tar);
figure(2);
imshow(K);
imwrite(K, 'resofhismatch.jpg', 'jpg');


