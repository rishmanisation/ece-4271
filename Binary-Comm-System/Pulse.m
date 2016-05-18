function S = Pulse(Bits, SNR)
%Function to generate pulse
SNR_lin = 10^(SNR/10);
T = 0.3;
A = abs(sqrt(SNR_lin/T));
for i = 1:1:length(Bits)
    if Bits(i) == 1
        S(i) = A;
    else
        S(i) = -A;
    end
end
end


