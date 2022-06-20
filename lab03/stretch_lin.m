function output_img = stretch_lin(input_img)
    min_value = min(input_img(:));
    max_value = max(input_img(:));
    diff = double(max_value - min_value);
    output_img = zeros(size(input_img,1), size(input_img,2), 'uint8');
    for x = 1:size(input_img, 1)
        for y = 1:size(input_img, 2)
            output_img(x, y) = round((255 / diff) * (input_img(x, y) - min_value));
        end
    end
end