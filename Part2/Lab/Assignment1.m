getImagesInPixel;
im2_lowcontrast = im2/2+80;


subplot(2,3,1);
imshow(im2_lowcontrast)
title('Image');
subplot(2,3,2);
imshow(im2)
title('Histogram');
imhist(im2_lowcontrast);
title('CDF');
subplot(2,3,3);
cdfplot(im2_lowcontrast(:));


im_stretched = stretchPixels(im2_lowcontrast);
subplot(2,3,4);
imshow(im_stretched)
title('Image');
subplot(2,3,5);
imshow(im2)
title('Histogram');
imhist(im_stretched);
title('CDF');
subplot(2,3,6);
cdfplot(im_stretched(:));

