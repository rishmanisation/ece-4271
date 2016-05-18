%Project 3: Part c
%Rishabh Ananthan

xhat1 = -X*a;
xhat2 = filter(x,djiaw(1:N-1,2),djiaw(1:N-3,2));

e = x + X*a;
E1 = 0;
for i = 1:length(e)
    E1 = E1 + abs(e(i))^2;
end
ehat2 = djiaw(1:N-3,2)-xhat2;
E2 = 0;
for i = 1:length(ehat2)
    E2 = E2 + abs(ehat2(i))^2;
end
% figure;
% hold on;
% plot(djiaw(1:517,1),xhat1,'b');
% plot(djiaw(1:517,1),xhat2,'r');
% plot(djiaw(1:517,1),djiaw(1:517,2),'k');
% datetick('x',1);
% figure;
% hold on;
% plot(djiaw(1:52,1),xhat1(1:52),'b');
% plot(djiaw(1:52,1),xhat2(1:52),'r');
% plot(djiaw(1:52,1),djiaw(1:52,2),'k');
% datetick('x',1);
figure;
hold on;
plot(e,'b');
plot(ehat2,'r');
