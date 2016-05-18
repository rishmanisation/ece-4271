function Qtext = QPSKnAlphabet(filename,QPSKSymbols,letter)
%top-level function for Part B

if (isempty(filename)) %if QPSKSymbols is specified instead of filename
    demodBn = QPSK2bin(QPSKSymbols);
else
    Bn = text2bin(filename); %converting text to bitstream
    Sn = bin2QPSK(Bn); %QPSK encoding the bitstream
    demodBn = QPSK2bin(Sn); %converting QPSK symbols to bits
end

Qtext = struct('mean',0,'std',0,'outtext','','oneLetfreq',0);
Qtext.outtext = bin2text(demodBn); %reconstructing the text

count = 0;
sum = 0;
msum = 0;

for i = 1:5:length(demodBn)-4
    sum = sum + bin2dec(demodBn(i:i+4)); %calculating the sum for mean
end

for i = 1:5:length(demodBn)-4 %calculating the sum of second moments
    msum = msum + (Qtext.mean - bin2dec(demodBn(i:i+4)))^2;
end

lcount = 0;

for i = 1:1:length(Qtext.outtext) %determining the number of times 'letter'
                                    %is present
    count = count + 1;
    if (Qtext.outtext(i)==letter)
        lcount = lcount + 1;
    end
end

Qtext.mean = sum/count;
Qtext.std = sqrt(msum)/(count-1);
Qtext.oneLetfreq = lcount/count;
end

