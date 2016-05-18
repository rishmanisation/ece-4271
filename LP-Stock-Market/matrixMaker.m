function [x,X] = matrixMaker(p)
%Function to create vector x and matrix X
%Rishabh Ananthan
load('djiaw_2006.mat');
N = 520;
x = djiaw(p+1:N,2);
pval = 1:10;
kval = pval - 1;
X = [];
for i = 1:p
    X = [X djiaw(pval(i):N-p+kval(i),2)];
end
end
