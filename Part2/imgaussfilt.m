function [ out ] = imgaussfilt( I , N, sigma)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
%     N = 5; %// Define size of Gaussian mask
%     sigma = 2; %// Define sigma here

    %// Generate Gaussian mask
    ind = -floor(N/2) : floor(N/2);
    [X Y] = meshgrid(ind, ind);
    h = exp(-(X.^2 + Y.^2) / (2*sigma*sigma));
    h = h / sum(h(:));

    %// Convert filter into a column vector
    h = h(:);

    %// Filter our image
    I;
    I = im2double(I);
    I_pad = padarray(I, [floor(N/2) floor(N/2)]);
    C = im2col(I_pad, [N N], 'sliding');
    C_filter = sum(bsxfun(@times, C, h), 1);
    out = col2im(C_filter, [N N], size(I_pad), 'sliding');
    figure, imshow(out);

end

