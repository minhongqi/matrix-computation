function x_SOR = SOR(A,b,x0,w,N_iteration,eps,x1)
N = size(A,2);
x_SOR=zeros(N,1);
k=0;
err=zeros(1,100);

while k < N_iteration
    for i=1:N
        if i==1
            x_SOR(1)=(1-w)*x0(1)+w*(b(1)-A(1,2:N)*x_SOR(2:N))/A(1,1);
        elseif i==N
            x_SOR(N)=(1-w)*x0(N)+w*(b(N)-A(N,1:N-1)*x0(1:N-1))/A(N,N);
        else
            x_SOR(i)=(1-w)*x0(i)+w*(b(i)-A(i,1:i-1)*x_SOR(1:i-1)-A(i,i+1:N)*x0(i+1:N))/A(i,i);       
        end  
    end
    if norm(x_SOR-x0)<eps
        break;
    end    
    x0=x_SOR;
    k=k+1;
    err(k) = norm(x_SOR-x1);
    
%     disp(['when SOR k=',num2str(k)])
%     disp('x=');
%     disp(x_SOR);                       %输出中间结果
end

if k==N_iteration
    disp('迭代次数已到达上限!');
end
disp(['SOR总迭代次数 k=',num2str(k)]);
disp(['最终误差：',num2str(err(k))]);


u=1:1:k;
error = err(1:k);
% subplot(2,2,3);
plot(u,log(error),'b*-');hold off;
title('log(error) : n=10');
legend('Jacobi','Gauss Seidel','SOR');
xlabel ({'k'}); ylabel ({'log(error)'});
end