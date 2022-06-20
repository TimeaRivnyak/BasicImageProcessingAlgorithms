function norm_HOG = pmHOG_extractHOG(I)
    h = size(I, 1) / 8;
    w = size(I, 2) / 8;
    norm_HOG = zeros([(h-1), (w-1), 36]);
    for x = 1:(h-1)
        for y = 1:(w-1)
            block = I((x-1)*8+1 : (x+1)*8, (y-1)*8+1 : (y+1)*8);
            block = imgaussfilt(block, 0.1);
            feature_vector = [];
            for cell_x = 1:2
                for cell_y = 1:2
                    cell = block((cell_x-1)*8+1 : cell_x*8, (cell_y-1)*8+1 : cell_y*8);
                    [PHI, MAG] = pmHOG_gradient(cell);
                    H = pmHOG_binner(PHI, MAG);
                    feature_vector = [feature_vector, H];
                end
            end
            feature_vector = feature_vector / sum(feature_vector);
            norm_HOG(x, y, :) = feature_vector;
        end
    end
end