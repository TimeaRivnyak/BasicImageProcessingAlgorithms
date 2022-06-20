function output_img = myconv(input_img, kernel)
    padded_img = padarray(input_img, [(size(kernel,1)-1)/2,(size(kernel,2)-1)/2], 0);
    rotated_kernel = rot90(kernel,2);
    output_img = zeros(size(input_img,1), size(input_img,2));
    for x = 1:size(output_img,1)
        for y = 1:size(output_img, 2)
            neighbourhood_matrix = padded_img(x:x+size(kernel,1)-1, y:y+size(kernel,2)-1);
            output_img(x,y) = sum(sum(neighbourhood_matrix.*rotated_kernel));
        end
    end
end