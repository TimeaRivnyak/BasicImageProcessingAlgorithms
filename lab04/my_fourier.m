function [F] = my_fourier(I)
    F = zeros(size(I, 1), size(I, 2));
    for k1 = 1:size(F, 1)
        for k2 = 1:size(F, 2)
            for n1 = 1:size(I, 1)
                for n2 = 1:size(I, 2)
                    e1 = -1j * ((2*pi)/size(I, 1)) * (k1 - 1) * (n1 - 1);
                    e2 = -1j * ((2*pi)/size(I, 2)) * (k2 - 1) * (n2 - 1);
                    F(k1, k2) = F(k1, k2) + (I(n1, n2) * exp(e1) * exp(e2));
                end
            end
        end
    end
end
