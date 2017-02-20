function [] = PlotSpectrogram(data, window, nOverlap, Fs)
%Plots the Spectogram in Matlab with input data given
%   Detailed explanation goes here

    if ~exist('titleAppend','var')
     % third parameter does not exist, so default it to something
        titleAppend = '';
    end
    titleText={'Periodogram Using FFT '};
    titleText=strcat(titleText,titleAppend);
    
    pxx = pwelch(data, window, nOverlap);
    spectrogram(pxx,window,200,1000,Fs);
    title('Short time fourier transform of Filter');
    zlabel('Magnitude');
    view(-45,65)
    shading interp
    colorbar
end
