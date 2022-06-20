function pine = find_the_pine(I)
    hsv_img = rgb2hsv(I);
    pine = 0.15 < hsv_img(:,:,1) < 0.25;
end