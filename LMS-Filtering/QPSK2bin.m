function demodBn = QPSK2bin(Sn)
%QPSK2bin: Function that converts a vector of QPSK symbols into a stream of
%          bits.
%USAGE: demodBn = QPSK2bin(Sn)
%OUTPUT: demodBn: bitstream
%INPUT: Sn: vector of QPSK symbols
%ECE 4271 Final Project
%Done by: Rishabh Ananthan
%GT ID: 902866080 (rananthan6)

demodBn = '';
for i = 1:1:length(Sn)
    if (real(Sn(i,1))>0 && imag(Sn(i,1))>0) %1st quadrant
        demodBn = strcat(demodBn,'00');
    elseif (real(Sn(i,1))>0 && imag(Sn(i,1))<0) %2nd quadrant
        demodBn = strcat(demodBn,'01');
    elseif (real(Sn(i,1))<0 && imag(Sn(i,1))>0) %3rd quadrant
        demodBn = strcat(demodBn,'10');
    elseif (real(Sn(i,1))<0 && imag(Sn(i,1))<0) %4th quadrant
        demodBn = strcat(demodBn,'11');
    end
end
end

