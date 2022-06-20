function [O] = image_segmenter(I, k)
    rowNumber = size(I, 1) * size(I, 2);
    S = reshape(I, [rowNumber, 3]);
    [LUT, M] = mykmeans(S, k);
    A = M(LUT, :);
    O = reshape(A, [size(I, 1), size(I, 2), 3]);
end 
