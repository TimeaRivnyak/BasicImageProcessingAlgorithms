function LUT = step2_assignment(S, k, LUT, M)
    d = zeros(1, k);
    for i = 1:size(S, 1)
        for j = 1:k
            d(i, j) = norm(S(i, :) - M(j, :))^2;
        end
        [~, ind] = min(d(i, :));
        LUT(i) = ind;
    end
end
