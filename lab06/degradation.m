function [y, h, n] = degradation(x)
    h = fspecial('motion', 42, 30);
    n = randn([size(x, 1) size(x, 2)], 'distributed') * sqrt(0.001);
    y = imfilter(x, h, 'replicate', 'same', 'conv') + n;
end
