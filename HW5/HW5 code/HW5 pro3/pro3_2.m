clc;
clear all;

A1 = load('A1.txt');
b1 = load('b1.txt');
x1 = load('x1.txt');
A2 = load('A2.txt');
b2 = load('b2.txt');
x2 = load('x2.txt');
eps = 1e-5;
N_iteration = 2000;

N=size(A1,2);
x0 = zeros(N,1);
N2=size(A2,2);
x00 = zeros(N2,1);

k_SOR=zeros(1,10);
k2_SOR=zeros(1,10);
for i=1:15
    w=0.1*i;
    [x_SOR,k_SOR(i)] = SOR_2(A1,b1,x0,w,N_iteration,eps,x1);
    [x_SOR2,k2_SOR(i)] = SOR_2(A2,b2,x00,w,N_iteration,eps,x2);
end

u=0.1:0.1:1.5;
plot(u,k_SOR,'ro-');hold on;
plot(u,k2_SOR,'b*-');hold off;
title('Number of iterations v.s. the value of w');
legend('Size 10 ','Size 1000');
xlabel ({'w'}); ylabel ({'Iterations' ,'/次'});