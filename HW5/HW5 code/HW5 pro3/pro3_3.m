clc;
clear all;

A1 = load('A1.txt');
b1 = load('b1.txt');
x1 = load('x1.txt');
A2 = load('A2.txt');
b2 = load('b2.txt');
x2 = load('x2.txt');
eps = 1e-20;
N_iteration = 100;

N=size(A1,2);
x0 = zeros(N,1);
w=0.9;
% x_jacobi = Jacobi(A1,b1,x0,N_iteration,eps,x1);
% x_GS = Gauss_Seidel(A1,b1,x0,N_iteration,eps,x1);
% x_SOR = SOR(A1,b1,x0,w,N_iteration,eps,x1);

N2=size(A2,2);
x00 = zeros(N2,1);
x_jacobi = Jacobi(A2,b2,x00,N_iteration,eps,x2);
x_GS = Gauss_Seidel(A2,b2,x00,N_iteration,eps,x2);
x_SOR = SOR(A2,b2,x00,w,N_iteration,eps,x2);
