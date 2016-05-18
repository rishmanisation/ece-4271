function [E] = sqerrorcalc(x,xhat)
E = 0;
for i = 1:length(x)
    E = E + abs(x(i)-xhat(i))^2;
end
end

