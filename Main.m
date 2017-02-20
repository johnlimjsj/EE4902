rng default
%get data
load ('johnData');
data = data;

Fs = 1000; % sampling frequency
F0_o=50; %interference frequency

noise_peaks=10;
notchfilter_cell=cell(1,noise_peaks);

s = [
    struct('N', 2, 'Q',5) 
    struct('N', 2, 'Q',10)
    struct('N', 2, 'Q',10) 
    struct('N', 2, 'Q',35)
    struct('N', 2, 'Q',35) 
    struct('N', 2, 'Q',35)
    struct('N', 2, 'Q',35) 
    struct('N', 2, 'Q',35)
    struct('N', 2, 'Q',35) 
    struct('N', 2, 'Q',100)
    ];

F0=F0_o;
for i = 1:noise_peaks 
   notchspec = fdesign.notch('N,F0,Q',s(i).N,F0,s(i).Q,Fs);
   nf = design(notchspec);
   notchfilter_cell{1,i}=nf;
   F0=F0+F0_o;
end
notchFilterArray = [notchfilter_cell{:}];

%a comb notching filter that repeats across a base frequency set
combspecs  = fdesign.comb('notch','N,Q',20,5,Fs);
combFilter = design(combspecs);

%combining the notch filter array and the comb filter
combined_filters = dfilt.cascade(notchFilterArray,combFilter);
notchFilter = dfilt.cascade(notchFilterArray);



%Choose the filter: 
filteredData = filter(notchFilter,data); %the filtered data

%dictionary of filters
Filter = containers.Map;
Filter('notch') = notchFilter;
Filter('comb') = combFilter;
Filter('combined') = combined_filters;

Data = containers.Map;
Data('original') = data;
Data('filtered') = filteredData;


% 
% subplot(2,2,1);
% PlotPowerSpectralFunc(data,Fs,'using no filter')
% subplot(2,2,2);
% PlotSpectrogram(data, Fs)
% subplot(2,2,3);
% filteredData = filter(notchFilter,data); %the filtered data
% PlotPowerSpectralFunc(filteredData,Fs,'using a notch filter')
% subplot(2,2,4);
PlotSpectrogram(data, window_2, 200, Fs)
