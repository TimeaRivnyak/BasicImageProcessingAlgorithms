function [x_tilde] = restoration_wiener(y, h, n)
    Y = fft2(y);
    N = fft2(n);
    H = psf2otf(h, size(Y));
    P_XX = Y .* conj(Y);
    P_NN = N .* conj(N);
    t = (P_NN ./ P_XX);
    div = (H.^2) + t;
    R = conj(H) ./ div;
    x_tilde = abs(ifft2(R .* Y));
end
