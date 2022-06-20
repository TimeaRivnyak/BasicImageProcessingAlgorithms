function [BGR] = swap_RB_smart(RGB)
    tmp = RGB(:, :, 1);
    RGB(:, :, 1) = RGB(:, :, 3);
    RGB(:, :, 3) = tmp;
    BGR = RGB;
end