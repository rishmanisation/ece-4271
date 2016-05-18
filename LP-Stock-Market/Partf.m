%Project 3: Part f
%Rishabh Ananthan

p = 10; %model order from Part d
N = 520;
lb1 = 1000*((1+0.03/52)^N); %all in the bank
lb2 = 1000;
%below loop for buy-and-hold
for i = length(djiaw)-519:length(djiaw)-1
    a = lb2;
    lb2 = a*djiaw(i+1,2)/djiaw(i,2); 
end

ub = 1000;
%below loop for best-possible
for i = length(djiaw)-519:length(djiaw)-1 
    b = ub;
    if ((djiaw(i+1,2)/djiaw(i,2))>(1+0.03/52))
        ub = b*djiaw(i+1,2)/djiaw(i,2);
    else
        ub = b*(1+0.03/52);
    end
end

amt = 1000;
xhatl = zeros(N,1);
for i = 1:N
    term = 0;
    for j = 1:p
        term = a10(j)*djiaw(length(djiaw)-519+i-j,2);
        xhatl(i) = xhatl(i) - term;
    end
end

for i = 1:length(xhatl)-1
    if ((xhatl(i+1)/xhatl(i))>(1+0.03/52))
        amt = amt*xhatl(i+1)/xhatl(i);
    else
        amt = amt*(1 + 0.03/52);
    end
end
    
APR = 52*((amt/1000)^(1/N)-1);