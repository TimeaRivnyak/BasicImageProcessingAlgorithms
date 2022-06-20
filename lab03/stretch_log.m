function output_img = stretch_log(input_img, c)
    log_img = zeros(size(input_img,1), size(input_img,2));
    for x = 1:size(input_img, 1)
        for y = 1:size(input_img, 2)
            log_img(x, y) = c * log(double(input_img(x, y)) + 1);
        end
    end
    min_value = min(log_img(:));
    max_value = max(log_img(:));
    diff = double(max_value - min_value);
    output_img = zeros(size(log_img,1), size(log_img,2), 'uint8');
    for x = 1:size(log_img, 1)
        for y = 1:size(log_img, 2)
            output_img(x, y) = round((255 / diff) * (log_img(x, y) - min_value));
        end
    end
end