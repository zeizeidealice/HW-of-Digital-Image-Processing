% 将图片双线性插值放大times倍（times小于1时缩小）
function [outimage] = mybilinearimresize(inimage, times)

% read the original image and the size of the it 
% inimage = imread(file_name);
[inheight, inwidth, inchanel] = size(inimage);

% get the size of the result image and initialize it
outheight = round(inheight * times);
outwidth = round(inwidth * times);
outimage = zeros(outheight, outwidth, inchanel, class(inimage));

% get the pixel value of the result image through
for xres = 1:outheight
    for yres = 1:outwidth
        xori = xres/times;
        xori1 = floor(xori);
        delx = xori - xori1;
        xori2 = xori1 + 1;
        yori = yres/times;
        yori1 = floor(yori);
        dely = yori - yori1;
        yori2 = yori1 + 1;
        if xori1 < 1
            xori1 = 1;
        elseif xori2 > inheight
            xori2 = inheight;
        end
        if yori1 < 1
            yori1 = 1;
        elseif yori2 > inwidth
            yori2 = inwidth;
        end
        outimage(xres,yres,:) = inimage(xori1,yori1,:) * (1 - delx) * (1 - dely) + inimage(xori1,yori2,:) * (1 - delx) * dely + inimage(xori2,yori2,:) * delx * (1 - dely) + inimage(xori2,yori2,:) *  delx * dely;
    end
end
