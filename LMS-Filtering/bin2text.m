function T = bin2text(demodBn)
%bin2text: Function that converts a bitstream into text.
%USAGE: T = bin2text(demodBn)
%OUTPUT: T: string containing the text
%INPUT: demodBn: bitstream
%ECE 4271 Final Project
%Done by: Rishabh Ananthan
%GT ID: 902866080 (rananthan6)

T = '';

%Mapping in below loop done as per directions in assignment
for i = 1:5:length(demodBn)-4 %loop to map bits to character
   if (demodBn(i:i+4) == '00000')
       T = horzcat(T,' ');
   elseif (demodBn(i:i+4) == '00001')
       T = horzcat(T,char(44));
   elseif (demodBn(i:i+4) == '00010')
       T = horzcat(T,char(46));
   elseif (demodBn(i:i+4) == '00011')
       T = horzcat(T,char(39));
   elseif (demodBn(i:i+4) == '00100')
       T = horzcat(T,char(10));
   elseif (demodBn(i:i+4) == '00101')
       T = horzcat(T,char(13));
   else
       T = horzcat(T,char(91+bin2dec(demodBn(i:i+4))));
   end
end

end

