impgm = fopen('greens.pgm', 'r');
if(impgm == -1)
    error('could not open the file');
end
[imagesize, num] = fscanf(impgm, 'P5 %d %d 255\n');
if(num ~= 2)
    error('error format');
end
image = [];
for height = 1:imagesize(2)
    image = [image fread(impgm, imagesize(1), 'uint8')];
end
image = image.';
fclose(impgm);
delete('imreadpgm.txt');
impgm = fopen('imreadpgm.txt', 'a');
fprintf(impgm, "P5 %d %d 255\n", imagesize);
fprintf(impgm, "%d ", image);
fclose(impgm);

