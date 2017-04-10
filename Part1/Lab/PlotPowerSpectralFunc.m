function [] = PlotPowerSpectralFunc( data, Fs, titleAppend )
%Plots the Power Spectral Density Function in Matlab with input data given
%   Detailed explanation goes here

    if ~exist('titleAppend','var')
     % third parameter does not exist, so default it to something
        titleAppend = '';
    end
    titleText={'Periodogram Using FFT '};
    titleText=strcat(titleText,titleAppend);
    
    N = length(data);
    xdft = fft(data);
    xdft = xdft(1:N/2+1);
    psdx = (1/(Fs*N)) * abs(xdft).^2;
    psdx(2:end-1) = 2*psdx(2:end-1);
    freq = 0:Fs/length(data):Fs/2;

    %Plotting the power spectral density function
    plot(freq,10*log10(psdx))
    grid on
    title(titleText)
    xlabel('Frequency (Hz)')
    ylabel('Power/Frequency (dB/Hz)')

end

