im = imread("greens.jpg", 'jpg');               % ����jpg
imwrite(im, 'greens.ppm', 'ppm');               % �洢Ϊppm
imwrite(im, 'greens.pgm', 'pgm');               % �洢Ϊpgm
imwrite(im, 'greens.pbm', 'encoding', 'ASCII'); % �洢Ϊpbm

