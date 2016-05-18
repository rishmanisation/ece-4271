%Project 3: Part g
%Rishabh Ananthan

amt = 1000;
for i = 1:length(djiaw)-1
    if((djiaw(i+1)/djiaw(i))>(1+0.03/52))
        amt = amt*djiaw(i+1)/djiaw(i);
    else
        amt = amt*(1+0.03/52);
    end
end