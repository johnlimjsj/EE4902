function [] = PlotSpectrogram(data, nSections, percentOverlap, Fs)
%Plots the Spectogram in Matlab with input data given
%   Detailed explanation goes here

    if ~exist('titleAppend','var')
     % third parameter does not exist, so default it to something
        titleAppend = '';
    end
    titleText={'Periodogram Using FFT '};
    titleText=strcat(titleText,titleAppend);
    
    len = length(data)
    wind = floor(len/nSections)
    overlap = floor(wind*percentOverlap)
    nff = max(256,2^nextpow2(wind));
    
    spectrogram(data,hamming(wind),overlap,nff,Fs); %
    [S, F, T, P] = spectrogram(data,hamming(wind),overlap,nff,Fs); %
    surf(T,F,P)
    title('Short time fourier transform of Filter');
    zlabel('Magnitude');
    view(-45,65)
    colorbar
end
