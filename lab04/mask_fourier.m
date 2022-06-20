function newF = mask_fourier(F, x, y, r)
    F = fftshift(F);
    x = round(x);
    y = round(y);
    k = numel(x);
    while k > 0
            x_1 = max(1, x(k) - r);
            x_2 = min(size(F,1), x(k) + r);
            y_1 = max(1, y(k) - r);
            y_2 = min(size(F,1), y(k) + r);
            F(y_1:y_2, x_1:x_2) = 0 + 0i;
            k = k - 1;
    end
    newF = ifftshift(F);
end
