clear;
clc;

y = load('label.txt');
A = load('data.txt');

tA = A;%只是为了创建gradient_descent时使用
x = ones(size(A,2),1);
k = 0;%迭代次数
lambda = 0.1;
while true
    gradient_descent = zeros(size(tA,2),1);
    z = A*x;
    gradient_descent = gradient_descent + 1e-5*(A'*(y - z)+lambda.*x);
    x = x + gradient_descent;
    k = k+1;
    if ( norm(y - A*x)^2 ) <= 100 | k>20000  
        break;
    end
%     fprintf('iterator times %d, error %f\n',k,( norm(y - A*x)^2 ));
end
fid=fopen(['E:\MatlabFile\HW5 pro1\','sol2.txt'],'w');%写入文件路径
for i=1:length(x)
    fprintf(fid,'%.16f\r\n',x(i));   %按列输出
end
fclose(fid);
loss = norm(A*x-y)^2