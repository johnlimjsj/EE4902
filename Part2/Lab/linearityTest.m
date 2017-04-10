function [] = linearityTest( im1, im2 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    im1_norm = im1/2;
    im2_norm = im2/2;
    imsum_norm_gauss = getGaussianBlurredImage(im1_norm+im2_norm, 15,12);
    
    subplot(1,3,1);
    imshow(im1_norm);
    title('Normalized Image 1');
    
    subplot(1,3,2);
    imshow(im2_norm);
    title('Normalized Image 2');

    subplot(1,3,3);
    imshow(imsum_norm_gauss);
    title('Sum of both images and gaussin blur applied');

    im1_norm_gauss = getGaussianBlurredImage(im1_norm, 15, 12);
    im2_norm_gauss = getGaussianBlurredImage(im2_norm, 15, 12);
    im_sum_norm_gauss = im1_norm_gauss + im2_norm_gauss;
    
    subplot(2,3,1);
    imshow(im1_norm_gauss);
    title('Normalized and Gaussian Blurred Image 1');
    
    subplot(2,3,2);
    imshow(im2_norm_gauss);
    title('Normalized and Gaussian Blurred Image 2');

    subplot(2,3,3);
    imshow(im_sum_norm_gauss);
    title('Sum of both images');
    
    im_subtract = im_sum_norm_gauss - imsum_norm_gauss
    figure
    imshow(im_subtract);
end

