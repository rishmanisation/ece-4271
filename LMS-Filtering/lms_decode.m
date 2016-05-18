function message = lms_decode(x)
%lms_decode: Function that attempts to filter out noise from the input
%            signal using an adaptive filter based on the LMS algorithm.
%USAGE: message = lms_decode(x)
%OUTPUT: message: it is a string output containing the decoded message
%INPUT: x: vector containing the QPSK symbols
%ECE 4271 Final Project
%Done by: Rishabh Ananthan
%GT ID: 902866080 (rananthan6)

L = 32; %choice of LMS filter order. This was chosen by trial and error.
msg_sym = []; %vector for output symbols
h = []; %vector for filter coefficients

%Creating the Training Sequence to be used as desired output for LMS
d_bin = ''; 
for i = 0:31
    d_bin = horzcat(d_bin,dec2bin(i,5)); %training sequence characters
end
d = bin2QPSK(d_bin); %training sequence in QPSK

%Using the Normalized LMS algorithm and obtaining a new vector of QPSK
%symbols
h = lms(L,x(1:length(d)),d);
msg_sym = conv(x,h); %output = input convolved with filter coefficients

%Converting the obtained QPSK symbols into a bitstream and then
%converting the bitstream into text
msg_bits = QPSK2bin(msg_sym); 
message = bin2text(msg_bits);
end

