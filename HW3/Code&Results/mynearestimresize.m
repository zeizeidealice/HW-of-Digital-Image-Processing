% 将图片近邻插值放大times倍（times小于1时缩小）
function [outimage] = mynearestimresize(inimage, times)

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
        xori = round(xres/times);
        yori = round(yres/times);
        if xori < 1
            xori = 1;
        elseif xori > inheight
            xori = inheight;
        end
        if yori < 1
            yori = 1;
        elseif yori > inwidth
            yori = inwidth;
        end
        outimage(xres,yres,:) = inimage(xori,yori,:) ;
    end
end

        
