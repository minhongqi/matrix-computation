function [Q,R]=givenQR(A)
n=size(A,2); %列数
Q=eye(n);
R=A;
for i=1:1:n-1
    G=eye(n);
    for j=n:-1:i+1
        J=eye(n);
        c=A(i,i)/sqrt(A(i,i)^2+A(j,i)^2);s=A(j,i)/sqrt(A(i,i)^2+A(j,i)^2);
        J(i,i)=c;J(i,j)=s;J(j,i)=-s;J(j,j)=c;
        A=J*A
        G=J*G
    end
    Gp=G*R      %compute problem 6(2)
    Gp=G'*R*G
    Q=Q*G';
    R=G*R   
end