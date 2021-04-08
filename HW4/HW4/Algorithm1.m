clear all;clc;
alpha = 2;
beta = 8;
A = [0 alpha ; beta 0];
q = [1;1];
for k = 1:10
    z = A * q;
    q = z / norm(z);
    lambda = q'*A*q
end
[v,D]=eig(A)

