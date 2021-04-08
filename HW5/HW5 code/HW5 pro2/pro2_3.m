clc;
clear all;

svd_min=zeros(1,30);
altho1_min=zeros(1,30);
n=1:1:30;
for m=1:1:30        
    A=0.1.*eye(m,m);%Generate an m*m upper triangular matrix with 0.1 on the main diagonal and 1 everywhere above the diagonal
    for i=1:1:m
        for j=i+1:1:m
            A(i,j)=1;            
        end
    end
    
    [U,S,V]=svd(A);
    svd_min(m)=log(S(m,m));
    
    [V1,D]=eig(A.'*A);
    for ii=1:1:m
        for jj=ii+1:1:m
            if D(ii,ii)<D(jj,jj)
                D(:,[ii jj])=D(:,[jj ii]);
                D([ii jj],:)=D([jj ii],:);
            end
        end
    end
    
    if D(m,m) > 0
        altho1_min(m)=log(sqrt(D(m,m)));        
        p1=plot(n(m),altho1_min(m),'b*');hold on;    
    end
end

p2=plot(n,svd_min,'ro');hold off;
xlabel('m');
ylabel('The smallest singular value');
legend([p1 p2],{'Algorithm 1','Use function SVD'})

