function x_GS=Gauss_Seidel(A,b,x0,N_iteration,eps,x1)
N = size(A,2);
x_GS=zeros(N,1);
k=0;
err=zeros(1,100);

while k < N_iteration
    for i=1:N
        if i==1
            x_GS(1)=(b(1)-A(1,2:N)*x_GS(2:N))/A(1,1);
        elseif i==N
            x_GS(N)=(b(N)-A(N,1:N-1)*x0(1:N-1))/A(N,N);
        else
            x_GS(i)=(b(i)-A(i,1:i-1)*x_GS(1:i-1)-A(i,i+1:N)*x0(i+1:N))/A(i,i);       
        end  
    end
    if norm(x_GS-x0)<eps
        break;
    end    
    x0=x_GS;
    k=k+1;
    
    err(k) = norm(x_GS-x1);
    
%     disp(['when Gauss_Seidel k=',num2str(k)])
%     disp('x=');
%     disp(x_GS);                       %输出中间结果
end

if k==N_iteration
    disp('迭代次数已到达上限!');
end
disp(['Gauss_Seidel总迭代次数 k=',num2str(k)]);
disp(['最终误差：',num2str(err(k))]);

u=1:1:k;
error=err(1:k);
% subplot(2,2,2);
plot(u,log(error),'gs-');hold on;

end