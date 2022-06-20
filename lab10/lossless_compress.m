function [compressed_image] = lossless_compress(noncompressed_image)
    compressed_image = cell(size(noncompressed_image, 1), 1);
    for y = 1:size(noncompressed_image, 1)
       symbol = noncompressed_image(y, 1);
       counter = 1;
       row_desc = [symbol];
       for x = 2:size(noncompressed_image, 2)
           if symbol == noncompressed_image(y, x)
               counter = counter + 1;
           else
               if symbol == 1
                   symbol = 0;
               else
                   symbol = 1;
               end
               row_desc = [row_desc, counter];
               counter = 1;
           end
       end
       row_desc = [row_desc, counter];
       compressed_image{y} = row_desc;
    end
end
