function RGBout = hueshifting(h,RGBin)

HSVin = rgb2hsv(RGBin);

Hin = HSVin(:,:,1);

Hout = Hin + 1/360 * h;

Hout(Hout >= 1) = Hout(Hout >= 1) - floor(Hout(Hout >= 1));
Hout(Hout < 0) = Hout(Hout < 0) - floor(Hout(Hout < 0));

HSVout = HSVin;
HSVout(:,:,1) = Hout;

RGBout = hsv2rgb(HSVout);

return;
end

