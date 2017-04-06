
getImagesInPixel;

% image stretching
im1_stretch=stretchPixels(im1);
im2_stretch=stretchPixels(im2);
im3_stretch=stretchPixels(im3);

%comparing images
compareImages(im3, 'Before Stretching', im3_stretch, 'After Stretching');

%gaussian filter
% im1_gauss = imgaussfilt(im1, 15, 10);
% im2_gauss = imgaussfilt(im2, 15, 10);
im3_gauss = imgaussfilt(im3, 15, 10);

% comparing images
medianFilterComparison(im3_gauss);



