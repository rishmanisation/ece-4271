%Project 3: Part e
%Rishabh Ananthan

p = 10; %model order from Part d
N = 520;
lb1 = 1000*((1+0.03/52)^N); %lower bound for bank
lb2 = 1000;
for i = p:p+N
    a = lb2;
    lb2 = a*djiaw(i+1,2)/djiaw(i,2); %lower bound for DJIA
end

ub = 1000;
for i = p:p+N-1 %loop for upper bound calculation
    b = ub;
    if ((djiaw(i+1,2)/djiaw(i,2))>(1+0.03/52))
        ub = b*djiaw(i+1,2)/djiaw(i,2);
    else
        ub = b*(1+0.03/52);
    end
end

amt = 1000;
xhatn = zeros(N,1);
for i = 1:N
    term = 0;
    for j = 1:p
        term = a10(j)*djiaw(520+i-j,2);
        xhatn(i) = xhatn(i) - term;
    end
end

for i = 1:length(xhatn)-1
    if ((xhatn(i+1)/xhatn(i))>(1+0.03/52))
        amt = amt*xhatn(i+1)/xhatn(i);
    else
        amt = amt*(1 + 0.03/52);
    end
end
    
APR = 52*((amt/1000)^(1/N)-1);
    
