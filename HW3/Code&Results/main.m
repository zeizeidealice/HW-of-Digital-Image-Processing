% ����jpgͼƬ
inimage = imread('football.jpg');
figure(1);
imshow(inimage);
title('jpgԭͼ');
% �����
outimage = mynearestimresize(inimage, 1.5);
figure(2);
imshow(outimage);
title('�����jpg���');
imwrite(outimage, 'footballnearest.jpg');
% ˫����
outimage = mybilinearimresize(inimage, 1.5);
figure(3);
imshow(outimage);
title('˫����jpg���');
imwrite(outimage, 'footballbilinear.jpg');

% ����jpgͼƬ
inimage = imread('IMG_6110.JPG');
figure(7);
imshow(inimage);
title('jpgԭͼ');
% �����
outimage = mynearestimresize(inimage, 30);
figure(8);
imshow(outimage);
title('�����jpg���');
imwrite(outimage, 'candynearest.jpg');
% ˫����
outimage = mybilinearimresize(inimage, 30);
figure(9);
imshow(outimage);
title('˫����jpg���');
imwrite(outimage, 'candybilinear.jpg');

% ����tiffͼƬ
[X, map] = imread('kids.tiff', 'tiff');
inimage = ind2rgb(X, map);
figure(4);
imshow(inimage);
title('tiffԭͼ');
% �����
outimage = mynearestimresize(inimage, 0.5);
figure(5);
imshow(outimage);
title('tiff����ڽ��');
imwrite(outimage, 'kidsnearest.tiff', 'tiff');
% ˫����
outimage = mynearestimresize(inimage, 0.5);
figure(6);
imshow(outimage);
title('tiff˫���Խ��');
imwrite(outimage, 'kidsbilinear.tiff', 'tiff');

