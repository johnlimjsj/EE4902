function [ filteredRGB ] = getGaussianBlurredImage(image, hsize, sigma )
    h = fspecial('gaussian', hsize, sigma);
    filteredRGB = imfilter(image, h);
    figure, imshow(filteredRGB)
end

