function [PHI, MAG] = pmHOG_gradient(I)   
    input_img = double(I);
    Hx = [-1, 0, 1];
    Hy = [-1; 0; 1];
    X = imfilter(input_img, Hx, 'replicate', 'same');
    Y = imfilter(input_img, Hy, 'replicate', 'same');
    PHI = rad2deg(atan(Y./X));
    MAG = sqrt(X.^2 + Y.^2);
end
