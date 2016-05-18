function [digits] = tt_decode(x)
 
%ECE 4271: Project 1
%TT_DECODE: This is a function that decodes DTMF signals.
%   DTMF signals are converted into their corresponding phone numbers.
%by Rishabh Ananthan
%GT ID: 902866080 (rananthan6)
 
digits = []; %the phone number that will be displayed as output
N = 205; %size of the DFT
f_s = 8000; %sampling frequency in Hertz
buttonMatrix = ['1' '2' '3'; '4' '5' '6'; '7' '8' '9'; '*' '0' '#'];
%the above is a matrix containing the various DTMF buttons
f_i = [697; 770; 852; 941; 1209; 1336; 1477];
%the above is the list of DTMF frequencies. The first four are low and...
%the last three are high
k = round(N*f_i/f_s);  %DFT indices
f_c = 1000; %cut-off frequency for filters
Wp = 2*pi*f_c/f_s; %Wp parameter in cheby1 function
[B1,A1] = cheby1(5,0.5,Wp/pi,'low'); %low-pass filter for low band
[B2,A2] = cheby1(5,0.5,Wp/pi,'high'); %high-pass filter for high band
sig_low = filter(B1,A1,x); %low-band of signal
sig_high = filter(B2,A2,x); %high-band of signal
low_index = 0; %index of low frequency terms
high_index = 0; %index of high frequency terms
 
for i = 1:N:length(x)-1
    if(length(x)-i>=205)
        %generating tones 205 samples long if...
        %there are 205 or more samples left
        tone_low = sig_low(i:i+204)';
        tone_high = sig_high(i:i+204)';
    else                      %otherwise tone is just the remaining samples
        tone_low = sig_low(i:end)';
        tone_high = sig_high(i:end)';
    end
    
    %taking DFT of low and high band using Goertzel algorithm
    dft_tone_low = abs(goertzel(tone_low,k+1));
    dft_tone_high = abs(goertzel(tone_high,k+1));
    
    %testing low band for presence of low frequency
    if(max(dft_tone_low)-mean(dft_tone_low)>10)
        low_index = find(dft_tone_low(1:4)==max(dft_tone_low));
    else
        low_index = 0;
    end
    
    %testing high band for high frequency
    if(max(dft_tone_high)-mean(dft_tone_high)>10) 
        high_index = find(dft_tone_high(5:7)==max(dft_tone_high));
    else
        high_index = 0;
    end
 
    %appending DTMF digit from the matrix declared 
    if(low_index>0) && (high_index>0)  
        digits = [digits buttonMatrix(low_index,high_index)];    
    end
 
end
end
