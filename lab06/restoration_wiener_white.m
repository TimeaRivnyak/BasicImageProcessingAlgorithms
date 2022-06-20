function [x_tilde] = restoration_wiener_white(y, h, var_n)
    Y = fft2(y);
    H = psf2otf(h, size(Y));
    NSPR = var_n ./ var(y(:));
    div = (H.^2) + NSPR;
    R = conj(H) ./ div;
    x_tilde = abs(ifft2(R .* Y));
end