clc;
clear all;

B=[3,2;1,4;1/2,1/2];
B.'*B;
[V,D]=eig(B.'*B)
V(:,[1 2])=V(:,[2 1])
[U,S]=qr(B*V)
S=abs(S)
U*S*V.'

