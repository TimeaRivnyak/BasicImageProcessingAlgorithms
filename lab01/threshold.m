function [TH] = threshold(IMG, level)
    if size(IMG, 3) == 1
        TH = IMG;
    else
        warning("Input image is not grayscale");
        TH = rgb2gray(IMG);
    end
    level = level/255;
    TH = imbinarize(TH, level);
end