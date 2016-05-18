function demodBn = QPSK2bin(Sn)
%Converts QPSK symbols into their corresponding bits
%and decodes the bit stream
demodBn = '';
for i = 1:1:length(Sn)
    if (round(real(Sn(i,1)))==1&&round(imag(Sn(i,1)))==1)
        demodBn = strcat(demodBn,'00');
    elseif (round(real(Sn(i,1)))==1&&round(imag(Sn(i,1)))==-1)
        demodBn = strcat(demodBn,'01');
    elseif (round(real(Sn(i,1)))==-1&&round(imag(Sn(i,1)))==1)
        demodBn = strcat(demodBn,'10');
    else
        demodBn = strcat(demodBn,'11');
    end
end

end

