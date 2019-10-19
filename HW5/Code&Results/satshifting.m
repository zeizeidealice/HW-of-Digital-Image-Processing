function RGBout = satshifting(s,RGBin)

HSVin = rgb2hsv(RGBin);

Sin = HSVin(:,:,2);

Sout = Sin + 0.01 * s;
Sout(Sout > 1) = 1;
Sout(Sout < 0) = 0;

HSVout = HSVin;
HSVout(:,:,2) = Sout;

RGBout = hsv2rgb(HSVout);

return;
end

