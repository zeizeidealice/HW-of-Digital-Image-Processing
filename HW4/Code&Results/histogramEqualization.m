function outimage = histogramEqualization(I)

% get the size of I
[R, C, B] = size(I);

% h is the histogram of I
h = zeros(256, 1, B);
for g = 0:255
    h(g + 1, 1, :) = sum(sum(I == g));
end

% a is the sum of the h
a = sum(h(:, :));

% p is pdf
p = zeros(256, 1, B);
p(:, :) = h(:, :) * (1/a(1, 1));

% P if cdf
P = zeros(256, 1, B);
temp = zeros(1, 1, B);
for g = 0:255
    temp = temp + p(g + 1, 1);
    P(g + 1, 1, :) = temp;
end

outimage = zeros(R, C, B, class(I));
for r = 1:R
    for c = 1:C
        for b = 1:B
             outimage(r, c, b) = 255 * P(I(r, c, b) + 1, 1, b);
        end
    end
end
outimage = uint8(outimage);
return;

end




