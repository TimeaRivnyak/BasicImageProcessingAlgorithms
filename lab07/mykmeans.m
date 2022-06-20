function [LUT, M] = mykmeans(S, k)
    [LUT, M] = step1_initialization(S, k);
    t = 0;
    threshold = 1;
    while threshold > 0.02 && t <= 100
        LUT = step2_assignment(S, k, LUT, M);
        M_old = M;
        M = step3_update(S, k, LUT, M);
        threshold = norm((M - M_old).^2);
        t = t + 1;
    end

    fprintf('Iteration finished after %d steps.\n', t);

end
