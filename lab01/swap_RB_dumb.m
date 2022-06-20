function [BGR] = swap_RB_dumb(RGB)
    [H, W, C] = size(RGB);
    for pixelX = 1:H
        for pixelY = 1:W
            tmp = RGB(pixelX, pixelY, 1);
            RGB(pixelX, pixelY, 1) = RGB(pixelX, pixelY, 3);
            RGB(pixelX, pixelY, 3) = tmp;
        end
    end
    BGR = RGB;
end