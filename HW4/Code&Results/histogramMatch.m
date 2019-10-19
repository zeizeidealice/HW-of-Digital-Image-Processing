function outimage = histogramMatch(inimage, target)

% get the size of two picture
[Rin, Cin, Bin] = size(inimage);
[~, ~, Btar] = size(target);

% hin is the histogram of inimage
% htar is the histogram of target
hin = zeros(256, 1, Bin); 
htar = zeros(256, 1, Btar);
for g = 0:255
    hin(g + 1, 1, :) = sum(sum(inimage == g));
    htar(g + 1, 1, :) = sum(sum(target == g));
end

% ain is the sum of the hin
% atar is the sum of the htar
ain = sum(hin(:, :));
atar = sum(htar(:, :));

% pin is the pdf of inimage
% ptar is the pdf of target
pin = zeros(256, 1, Bin);
pin(:, :) = hin(:, :) * (1/ain(1, 1));
ptar = zeros(256, 1, Btar);
ptar(:, :) = htar(:, :) * (1/atar(1, 1));

% Pin is the cdf of inimage
% Ptar is the cdf of target
Pin = zeros(256, 1, Bin);
tempin = zeros(1, 1, Bin);
Ptar = zeros(256, 1, Btar);
temptar = zeros(1, 1, Btar);
for g = 0:255
    tempin = tempin + pin(g + 1, 1);
    temptar = temptar + ptar(g + 1, 1);
    Pin(g + 1, 1, :) = tempin;
    Ptar(g + 1, 1, :) = temptar;
end

% match
% Pout is the match method
Pout = zeros(256, 1, Bin);
for b = 1:Bin
    gin = 1;
    gtar = 1;
    while (gin <= 256) && (gtar <= 256)
        if Pin(gin, 1, b) < Ptar(gtar, 1, b)
            Pout(gin, 1, b) = gtar;
            gin = gin + 1;
        elseif Pin(gin, 1, b) == Ptar(gtar, 1, b)
            Pout(gin, 1, b) = gtar;
            gin = gin + 1;
            gtar = gtar + 1;
        elseif Pin(gin, 1, b) > Ptar(gtar, 1, b) && gtar <= 255 && Pin(gin, 1, b) < Ptar(gtar + 1, 1, b)
            Pout(gin, 1, b) = gtar;
            gin = gin + 1;
            gtar = gtar + 1;
        else
            gtar = gtar + 1;
        end
    end
end

outimage = zeros(Rin, Cin, Bin, class(inimage));
for r = 1:Rin
    for c = 1:Cin
        for b = 1:Bin
             outimage(r, c, b) = Pout(inimage(r, c, b) + 1, 1, b) - 1;
        end
    end
end
outimage = uint8(outimage);
return;

end