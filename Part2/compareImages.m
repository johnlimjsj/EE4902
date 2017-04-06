function [] = compareImages( im1, im1_title, im2, im2_title )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    figure
    subplot(1,2,1);
    imshow(im1)
    title(im1_title);
    set(subplot(1,2,2),'Color','Red')
    subplot(1,2,2);
    imshow(im2)
    title(im2_title);

end

