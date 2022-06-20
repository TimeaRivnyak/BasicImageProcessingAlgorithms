function MODEL = training_phase(T_cell)
    N = size(T_cell, 2);
    MODEL = zeros(N, 9);
    for n = 1:N
        [h, w] = size(T_cell{n});
        for k = 1:9
            A = conv2(T_cell{n}, laws_kernel(k), 'same');
            MODEL(n, k) = 1/(h * w) * sum(sum(A(:).^2));
        end
    end
end
