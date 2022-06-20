function [score] = detectPedestrians(I, sample_HOG)
    HOG = pmHOG_extractHOG(I);
    multiplicated_HOG = HOG .* sample_HOG;
    significant_values = multiplicated_HOG > 0.01;
    M = multiplicated_HOG(significant_values);
    score = nansum(M(:));
end 
