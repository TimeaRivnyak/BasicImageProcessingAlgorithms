function H = laws_kernel(k)
    L = 1/6 * [1;2;1];
    E = 1/2 * [1;0;-1];
    S = 1/2 * [1;-2;1];
    if (1 <= k && k <= 9)
        if (k == 1)
            H = L*transpose(L);
        elseif(k == 2)
            H = L*transpose(E);
        elseif(k == 3)
            H = L*transpose(S);
        elseif(k == 4)
            H = E*transpose(L);
        elseif(k == 5)
            H = E*transpose(E);
        elseif(k == 6)
            H = E*transpose(S);
        elseif(k == 7)
            H = S*transpose(L);
        elseif(k == 8)
            H = S*transpose(E);
        else
            H = S*transpose(S);
        end 
    else
        error('Input k is not in the appropriate range.');
    end
end
