function [] = medianFilterComparison( im_in )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    im_in_noise = imnoise(im_in,'salt & pepper',0.02);
    im_in_2dmedian_filter = medfilt2(im_in_noise);
    compareImages(im_in_noise, 'Before Median Filter', im_in_2dmedian_filter, 'After Median Filter')
end
