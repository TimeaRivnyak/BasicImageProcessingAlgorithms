function M = step3_update(S, k, LUT, M)
    for j = 1:k
        assigned = S((LUT == j), :);
        M(j, :) = mean(assigned, 1);
    end
end
