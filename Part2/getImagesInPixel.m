
imgPath = 'images/image';

% for str = {'aaa','bbb'}
%   imagepx = imread('images/week10/image001.jpg');
%   image1_px = rgb2gray(image1_px);
% end

B = cat(3, [2 8; 0 5])
B(:,:,1)
B = cat(3, [2 8; 0 5], [1 3; 7 9])

image1_px = imread('images/image1.jpg');
image1_px = rgb2gray(image1_px);
image2_px = imread('images/image2.jpg');
image2_px = rgb2gray(image2_px);
image3_px = imread('images/image3.jpg');
image3_px = rgb2gray(image3_px);
