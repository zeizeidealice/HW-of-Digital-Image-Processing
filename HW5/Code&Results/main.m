clear;
clc;
close all;

rgbin = imread('test.jpg');
hueshiftimg60 = hueshifting(60, rgbin);
hueshiftimg120 = hueshifting(120, rgbin);
hueshiftimg240 = hueshifting(240, rgbin);
satshiftimg30 = satshifting(30, rgbin);
satshiftimg60 = satshifting(60, rgbin);
satshiftimg90 = satshifting(90, rgbin);

figure(1);
imshow(hueshiftimg60);
imwrite(hueshiftimg60,'hueshift60.jpg','jpg');

figure(2);
imshow(hueshiftimg120);
imwrite(hueshiftimg120,'hueshift120.jpg','jpg');

figure(3);
imshow(hueshiftimg240);
imwrite(hueshiftimg240,'hueshift240.jpg','jpg');

figure(4);
imshow(satshiftimg30);
imwrite(satshiftimg30,'satshift30.jpg','jpg');

figure(5);
imshow(satshiftimg60);
imwrite(satshiftimg60,'satshift60.jpg','jpg');

figure(6);
imshow(satshiftimg90);
imwrite(satshiftimg90,'satshift90.jpg','jpg');
