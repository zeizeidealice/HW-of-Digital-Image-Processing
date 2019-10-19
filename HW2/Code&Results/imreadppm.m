function [] = imreadppm(s)
imppm = fopen(s, 'r');
if(imppm == -1)
    error('could not open the file');
end
[imagesize, num] = fscanf(imppm, 'P6 %d %d 255\n');
if(num ~= 2)
    error('error format');
end
imager = [];
imageg = [];
imageb = [];
for height = 1:imagesize(2) 
    imager = [imager fread(imppm, imagesize(1), 'uint8')];
    imageg = [imageg fread(imppm, imagesize(1), 'uint8')];
    imageb = [imageb fread(imppm, imagesize(1), 'uint8')];
end
imager = imager.';
imageg = imageg.';
imageb = imageb.';
fclose(imppm);
delete('ppmr.txt');
imppm = fopen('ppmr.txt', 'a');
fprintf(imppm, "%d ", imager);
fclose(imppm);
delete('ppmg.txt');
imppm = fopen('ppmg.txt', 'a');
fprintf(imppm, "%d ", imageg);
fclose(imppm);
delete('ppmb.txt');
imppm = fopen('ppmb.txt', 'a');
fprintf(imppm, "%d ", imageb);
fclose(imppm);
delete('imreadppm.txt');
imppm = fopen('imreadppm.txt', 'a');
fprintf(imppm, "P6 %d %d 255\n", imagesize);
for width = 1:imagesize(1)
    for height = 1:imagesize(2)
        fprintf(imppm, "%d ", imager(height,width), imageg(height,width), imageb(height,width));
    end
end
fclose(imppm);

