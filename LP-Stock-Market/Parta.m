%Project 3: Part a
%Rishabh Ananthan

load('djiaw_2006.mat');
a0 = 1000; %investment at the end of one week
apr = 0.03;
N = 4043;
subplot(211);
xlabel('Date');
ylabel('DJIA');
plot(djiaw(:,1),djiaw(:,2)); %plotting djiaw data
datetick('x',1);
subplot(212);
xlabel('Date');
ylabel('log(DJIA)');
semilogy(djiaw(:,1),djiaw(:,2)); %plot data on semilog scale
datetick('x',1);
%loop for DJIA calculation
DJIA_end = 1000;
for i = 1:N
    a = DJIA_end;
    DJIA_end = a*djiaw(i+1)/djiaw(i);
end

bank3_end = a0*((1+apr/52))^N; %value of investment at the end of DJIA

%APR calculation for same performance as DJIA
APR = 52*((DJIA_end/a0)^(1/N)-1);