function Sn = bin2QPSK(Bn)
%Converts stream of bits into QPSK symbols
Sn = zeros(length(Bn)/2,1);
b2n = 0;
b2n1 = 0;
for n=1:1:length(Bn)/2
    b2n = str2num(Bn(2*n-1));
    b2n1 = str2num(Bn(2*n));
    Sn(n,1) = (-1).^(b2n)+1i*(-1).^(b2n1);    
end
end
