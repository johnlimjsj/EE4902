rng default
%get data
load ('johnData');
data = data;

Fs = 1000; % sampling frequency
F0_o=50; %interference frequency

noise_peaks=10;
notchfilter_cell=cell(1,noise_peaks);

s = [
    struct('N', 4, 'Q',8) 
    struct('N', 2, 'Q',10)
    struct('N', 2, 'Q',10) 
    struct('N', 2, 'Q',35)
    struct('N', 2, 'Q',35) 
    struct('N', 2, 'Q',35)
    struct('N', 2, 'Q',35) 
    struct('N', 2, 'Q',35)
    struct('N', 2, 'Q',35) 
    struct('N', 2, 'Q',35)
    ];

F0=F0_o;
for i = 1:noise_peaks 
   notchspec = fdesign.notch('N,F0,Q',s(i).N,F0,s(i).Q,Fs);
   notchfilter = design(notchspec);
   notchfilter_cell{1,i}=notchfilter;
   F0=F0+F0_o;
end
notchfilter_array = [notchfilter_cell{:}];

%a comb notching filter that repeats across a base frequency set
combspecs  = fdesign.comb('notch','N,Q',20,5,Fs);
combfilter = design(combspecs);

combined_filters = dfilt.cascade(notchfilter_array,combfilter);

%Choose the filter: 
data = filter(combfilter,data); %the filtered data

PlotPowerSpectralFunc(data,Fs,'using a comb filter')
