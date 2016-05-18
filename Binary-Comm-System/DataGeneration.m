function Bits = DataGeneration(Length)
%Generates a random sequence of 0s and 1s of given Length
Bits = randi(2,1,Length)-1;
end

