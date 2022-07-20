



function [T,original_spectrum,processed_spectrum,frequency_spectrum,selected_index]=find_periods(x,number_of_harmonics,peak_diff_samples)

T=[];
selected_index=[];
data=x;

Data=fftshift(fft(data,max(length(data),1023)));
Fmax=0.5;
M=(length(Data)-1)/2;
f_interval=linspace(0,Fmax,M+1);
Selected_Data=Data(M+1:end);


Temp=Selected_Data;
for i=1:number_of_harmonics
    [~,n1]=max(abs(Temp));
    try 
        Temp(n1-peak_diff_samples:n1+peak_diff_samples)=0;     % ignore the maximum close to the one that you just found
    catch
        Temp(n1)=0;
    end
    T(i)=1/f_interval(n1);
    selected_index(i)=n1;
end


original_spectrum=Selected_Data;
processed_spectrum=Temp(1:length(original_spectrum));
frequency_spectrum=f_interval;

