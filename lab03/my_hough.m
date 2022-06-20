function [H] = my_hough(input_img)
    radius = hypot(size(input_img, 1), size(input_img, 2));
    theta = 180;
    H = zeros(round(radius), theta);
    for x = 1:size(input_img, 1)
        for y = 1:size(input_img, 2)
            if input_img(x, y) == 1
                for t = 1:180
                    r = round(x * cosd(t) + y * sind(t));
                    if r > 0
                        H(r, t) = H(r, t) + 1;
                    end
                end
            end
        end
    end
end