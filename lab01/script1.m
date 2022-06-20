img = imread("AlfredoBorba_TuscanLandscape.jpg");
imshow(img);
isColor = logical(size(img, 3));
gray_img = rgb2gray(img);
imshow(gray_img);
imwrite(gray_img, 'output\AlfredoBorba_TuscanLandscape_GRAY.jpg');