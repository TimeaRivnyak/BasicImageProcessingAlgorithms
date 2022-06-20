function ClassMap = recognition_phase(I, MODEL)
    ClassMap = zeros(size(I));
    B = zeros(size(I));
    N = 1/(15 * 15) * ones(15);
    BB = zeros(size(I, 1), size(I, 2), 9);
    for k = 1:9
        B =  conv2(I, laws_kernel(k), 'same');
        BB(:, :, k) = conv2(B.^2, N, 'same');
    end

    for x = 1:size(I, 1)
        for y = 1:size(I, 2)
            sum_abs_diff = zeros(size(MODEL, 1));
            for n = 1:size(MODEL, 1)
                b = 0;
                for k = 1:9
                    b = b + abs(BB(x, y, k) - MODEL(n, k));
                end
                sum_abs_diff(n) = b;
            end
            min = sum_abs_diff(1);
            h = 1;
            for m = 1:size(MODEL, 1)
                if (sum_abs_diff(m) < min)
                    min = sum_abs_diff(m);
                    h = m;
                end
            end
            ClassMap(x,y) = h;
        end
    end
end
