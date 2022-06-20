function out_img = blur_edge(in_img)
    PSF = fspecial('gaussian', 60, 10);
    OTF = psf2otf(PSF, size(in_img));
    blurred_img = abs(ifft2(OTF .* fft2(in_img)));
    wm = ones(70);
    wm = padarray(wm, [1 1], 0, 'both');
    wm2 = imresize(wm, size(in_img), 'bilinear');
    wm2 = mat2gray(wm2, [0, 1]);
    out_img = zeros(size(in_img, 1), size(in_img, 2);
    out_img = in_img .* wm2 + blurred_img .* (1 - wm2);
end
