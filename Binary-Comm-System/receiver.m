function est_Bits = receiver(S_rx)
%Receiver of binary communication system
T = 0.3;
N = 10;
est_Bits = [];
for i = 1:1:length(S_rx)
    if (S_rx(i)<0)
        est_Bits = [est_Bits 0];
    else
        est_Bits = [est_Bits 1];
    end
end      

end

