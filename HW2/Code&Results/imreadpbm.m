impbm = fopen('greens.pbm', 'r');
if(impbm == -1)
    error('could not open the file');
end
[imagesize, num] = fscanf(impbm, 'P1 %d %d\n');
if(num ~= 2)
    error('error format');
end
image = [];
for i = 1:imagesize(1) * imagesize(2)
    image = [image fscanf(impbm, '%d ')];
end
image = image.';
fclose(impbm);
delete('imreadpbm.txt');
impbm = fopen('imreadpbm.txt', 'a');
fprintf(impbm, "P1 %d %d\n", imagesize);
fprintf(impbm, "%d ", image);
fclose(impbm);

