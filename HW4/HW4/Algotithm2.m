clear all;clc;
alpha = 2;
beta = 8;
A = [0 alpha ; beta 0];
n=length(A)
mu = input('mu=')
q = rand(2,1)
for k = 1:1000
    z = inv(A-mu*eye(n,n)) * q;
    q = z / norm(z);
    lambda = q'*A*q
end
[v,D]=eig(A)