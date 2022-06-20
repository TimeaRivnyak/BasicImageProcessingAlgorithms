function H = pmHOG_binner(PHI, MAG)
    H = zeros(1, 9);
    mini = [-90 -70 -50 -30 -10 10 30 50 70];
    maxi = [-70 -50 -30 -10 10 30 50 70 90];
    for i = 1:9
        LOG_MASK = (PHI >= mini(i) & PHI < maxi(i));
        elements = MAG(LOG_MASK);
        H(i) = sum(elements);
    end
end
