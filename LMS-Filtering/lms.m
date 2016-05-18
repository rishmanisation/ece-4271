function h = lms(L,x,d)
%lms: Function that implements the Normalized LMS algorithm.
%USAGE: h = lms(L,x,d)
%OUTPUT: h: L x 1 vector of filter coefficients
%INPUT: L: order of the filter
%       x: N x 1 vector containing the input signal
%       d: N x 1 vector containing the desired signal
%ECE 4271 Final Project
%Done by: Rishabh Ananthan
%GT ID: 902866080 (rananthan6)

h = [1;zeros(L-1,1)]; %initializing filter to a no-op filter
N = length(x); 

%Normalized LMS algorithm follows
for k = L:N
    xk = x(k:-1:k-L+1);  
    eps_k = d(k) -(h')*xk;
    mu = 0.5/(xk'*xk+0.001); 
    h = h + mu*conj(eps_k)*xk;
end
end
