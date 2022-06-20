function [decompressed_image] = lossless_decompress(compressed_image)
    decompressed_image = [];
    cellsz = cellfun(@size,compressed_image,'uni',false);
    for y = 1:size(compressed_image, 1)
        symbol = compressed_image{y}(1);
        row_pixels = [];
        size(compressed_image, 2);
        for x = 2:size(cellsz{y}, 2)
            block = repmat(symbol, 1, compressed_image{y}(x));
            row_pixels = [row_pixels, block];
            if symbol == 1
                symbol = 0;
            else
                symbol = 1;
            end
        end
        decompressed_image(y, :) = row_pixels;
    end
end