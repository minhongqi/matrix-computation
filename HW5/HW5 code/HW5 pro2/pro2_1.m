clc;
clear all;

A=[0 1 0 0;0 0 2 0;0 0 0 3;1/6000 0 0 0];
[V,D]=eig(A)
[V0,D0]=eig(sqrt(A.'*A))
for ii=1:1:4
    for jj=ii+1:1:4
        if D0(ii,ii)<D0(jj,jj)
            D0(:,[ii jj])=D0(:,[jj ii]);
            D0([ii jj],:)=D0([jj ii],:);
        end
    end
end
D0
[V1,D1]=eig(A.'*A)
[U,S,V2] = svd(A)


