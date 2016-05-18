function bn = text2bin(filename)
%Converts a text file to a specially encoded bit-stream
file = fopen(filename); %opening the file
bn = '';
tline = fgets(file); %reading a line from the file
while ischar(tline)  %converting text to bitstream
    for i = 1:1:length(tline)
        if (double(tline(i))==32)
            bn = strcat(bn,'00000');
        elseif (double(tline(i))==44)
            bn = strcat(bn,'00001');
        elseif (double(tline(i))==46)
            bn = strcat(bn,'00010');
        elseif (double(tline(i))==39)
            bn = strcat(bn,'00011');
        elseif (double(tline(i))==10)
            bn = strcat(bn,'00100');
        elseif (double(tline(i))==13)
            bn = strcat(bn,'00101');
        elseif (double(tline(i))>=97 && double(tline(i))<=122)
            bn = strcat(bn,dec2bin(double(tline(i))-91,5));
        else
            bn = strcat(bn,dec2bin(double(tline(i))-59,5));
        end
    end               
    tline = fgets(file);
end
fclose(file);
if (mod(length(bn),2)~=0) %adding extra zero to bitstream of odd length
    bn = strcat(bn,'0');
end
end

