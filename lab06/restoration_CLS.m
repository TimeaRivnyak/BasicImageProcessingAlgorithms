function [x_tilde] = restoration_CLS(y, h, alpha, c)
    Y = fft2(y);
    H = psf2otf(h, size(Y));
    C = psf2otf(c, size(Y));
    div = (abs(H).^2) + alpha * (abs(C).^2);
    R = conj(H) ./ div;
    x_tilde = abs(ifft2(R .* Y));
end
