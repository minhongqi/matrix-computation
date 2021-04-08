clc;
clear all;

load('data1.mat');
A = data1;

[D,N] = size(A);
K = min([D N],[],2);
[U,S,V] = svd(A);
squared_sv = zeros(1,10);
fenmu = 0;
for i0 = 1:1:10
    squared_sv(i0) = S(i0,i0)^2;
    fenmu = fenmu + S(i0,i0)^2;
end
tao = 150*ones(1,10);
j = 1:1:10;
figure(1);
plot(j,squared_sv,'ko-',j,tao,'r-');
legend('Squared singular values of A','tao')

f = zeros(1,K);

for d=1:1:K
    fenzi = 0;
    for i=d+1:1:K
        fenzi = fenzi + S(i,i)^2;
    end
    f(d) = fenzi / fenmu;
end
figure(2);
stairs(j,f,'k-');hold on;
plot([1 10],[0.1 0.1],'r-');
text(7,0.1,'tao1=0.1');
plot([1 10],[0.05 0.05],'r-');
text(7,0.05,'tao1=0.05');
plot([1 10],[0.02 0.02],'r-');
text(7,0.02,'tao1=0.02');
plot([1 10],[0.005 0.005],'r-');
text(7,0.005,'tao1=0.005');
ylim([0,0.11]);%对Y轴设定显示范围 

d_xing = [1,2,3,4];
compression_rate = d_xing*(D+N+1)/(N*D)



