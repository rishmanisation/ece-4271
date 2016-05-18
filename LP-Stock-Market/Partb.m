%Project 3: Part b
%Rishabh Ananthan

p = 3;
N = 520;

x = djiaw(p+1:N,2);
X1 = djiaw(1:N-p,2);
X2 = djiaw(2:N-p+1,2);
X3 = djiaw(3:N-p+2,2);
X = [X1 X2 X3];

a = -X\x;