function Noise = NoiseGeneration(S_len)
%Generates WGN of given length
Noise = wgn(1,S_len,0);
end

