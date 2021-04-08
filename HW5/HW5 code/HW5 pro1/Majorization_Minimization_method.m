clear;
clc;

y = load('label.txt');
A = load('data.txt');

[m,n]=size(A);
x=zeros(n,1);
lambda = 0.1;
c = 1e+5;
for k=1:1:20000
    left=(1/c).*A.'*(y-A*x)+x;
    x=soft(left,lambda/c);
end
loss = norm(A*x-y)^2

x_rls=inv(A.'*A+lambda.*eye(n,n))*A.'*y;
fid=fopen(['E:\MatlabFile\HW5 pro1\','sol0.txt'],'w');%写入文件路径
for iii=1:length(x)
    fprintf(fid,'%.16f\r\n',x_rls(iii));   %按列输出
end
fclose(fid);


fid=fopen(['E:\MatlabFile\HW5 pro1\','sol1.txt'],'w');%写入文件路径
for ii=1:length(x)
    fprintf(fid,'%.16f\r\n',x(ii));   %按列输出
end
fclose(fid);