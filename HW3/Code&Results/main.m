% 测试jpg图片
inimage = imread('football.jpg');
figure(1);
imshow(inimage);
title('jpg原图');
% 最近邻
outimage = mynearestimresize(inimage, 1.5);
figure(2);
imshow(outimage);
title('最近邻jpg结果');
imwrite(outimage, 'footballnearest.jpg');
% 双线性
outimage = mybilinearimresize(inimage, 1.5);
figure(3);
imshow(outimage);
title('双线性jpg结果');
imwrite(outimage, 'footballbilinear.jpg');

% 测试jpg图片
inimage = imread('IMG_6110.JPG');
figure(7);
imshow(inimage);
title('jpg原图');
% 最近邻
outimage = mynearestimresize(inimage, 30);
figure(8);
imshow(outimage);
title('最近邻jpg结果');
imwrite(outimage, 'candynearest.jpg');
% 双线性
outimage = mybilinearimresize(inimage, 30);
figure(9);
imshow(outimage);
title('双线性jpg结果');
imwrite(outimage, 'candybilinear.jpg');

% 测试tiff图片
[X, map] = imread('kids.tiff', 'tiff');
inimage = ind2rgb(X, map);
figure(4);
imshow(inimage);
title('tiff原图');
% 最近邻
outimage = mynearestimresize(inimage, 0.5);
figure(5);
imshow(outimage);
title('tiff最近邻结果');
imwrite(outimage, 'kidsnearest.tiff', 'tiff');
% 双线性
outimage = mynearestimresize(inimage, 0.5);
figure(6);
imshow(outimage);
title('tiff双线性结果');
imwrite(outimage, 'kidsbilinear.tiff', 'tiff');

