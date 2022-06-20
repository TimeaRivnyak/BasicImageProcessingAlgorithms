function [LUT, M] = step1_initialization(S, k)
    LUT = zeros(1, size(S, 1));
    M = zeros(k, size(S, 2));
    th_element = floor(size(S, 1)/k);
    j = 1;
    for i = 1:k
        M(i, :) = S(j, :);
        j = j + th_element;
    end
end
