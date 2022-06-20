function [PAD] = pad_image(varargin)
    IMG = varargin{1};
    if length(varargin) == 2
        border_size = varargin{2};
    else
        border_size = 10;
    end
    
    if size(IMG, 3) == 1
        gray_img = IMG;
    else
        warning("Input image is not grayscale");
        gray_img = rgb2gray(IMG);
    end
    [H, W] = size(gray_img);
    H = H + border_size*2;
    W = W + border_size*2;
    PAD = zeros(H, W, 'uint8');
    PAD(border_size:(H-border_size)-1, border_size:(W-border_size)-1) = gray_img;
end