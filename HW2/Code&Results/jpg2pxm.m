im = imread("greens.jpg", 'jpg');               % 读入jpg
imwrite(im, 'greens.ppm', 'ppm');               % 存储为ppm
imwrite(im, 'greens.pgm', 'pgm');               % 存储为pgm
imwrite(im, 'greens.pbm', 'encoding', 'ASCII'); % 存储为pbm


