function x_jacobi=Jacobi(A,b,x0,N_iteration,eps,x1)
N = size(A,2);
x_jacobi=zeros(N,1);      % 给x赋值
k=0;
err=zeros(1,100);

while k < N_iteration
    for i=1:N
     x_jacobi(i)=(b(i)-A(i,[1:i-1,i+1:N])*x0([1:i-1,i+1:N]))/A(i,i);
    end
    if norm(x_jacobi-x0)<eps
        break;
    end
    x0=x_jacobi;
    k=k+1;
    err(k) = norm(x_jacobi-x1);

%     disp(['when Jacobi k=',num2str(k)])
%     disp('x=');
%     disp(x_jacobi);                       %输出计算的中间结果
end

if k==N_iteration
    disp('迭代次数已到达上限!');
end
disp(['Jacobi总迭代次数 k=',num2str(k)]);
disp(['最终误差：',num2str(err(k))]);
u=1:1:k;
% length(u)
% length(err)
% err
error=err(1:k);
% error
% length(error)
% subplot(2,2,1);
plot(u,log(error),'ro-');hold on;

end