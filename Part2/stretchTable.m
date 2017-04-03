function [ map ] = stretchTable( imagein )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    map=zeros(256);
    a=double(min(imagein(:)))%find min and max pixel values to determine stretch constants
    b=double(max(imagein(:)))
    map = 0:255/(b-a):255;%remap values to 0,255
    map(1:a) = 0;%everything else is 0 or 255
    map(b:255) = 255;
    map = transpose(map) * [1 1 1];%change this to an appropriate colormap of the form

end

