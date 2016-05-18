function BER = transceiver(length,SNR)
%top level function for Part A
Bits = DataGeneration(length); %generating the binary sequence
S = Pulse(Bits,SNR); %generating the pulse using rectangular pulse shapers
Noise = NoiseGeneration(numel(S)); %generating the WGN 
est_Bits = receiver(S + Noise); %filtering and decision threshold
count = 0; 
for i = 1:1:numel(est_Bits)
    if est_Bits(i) ~= Bits(i)
        count = count + 1;    %counting the number of errors
    end
end
BER = count/numel(Bits);
end

