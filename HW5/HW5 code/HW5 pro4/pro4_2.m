clc;
clear all;

load('all_data.mat');
X = data_train;
d=2;

figure(1);
mu = mean(X,2);
image_mu = reshape(mu,48,42);
subplot(2,4,1);imshow(image_mu,[]);
title('The mean face');

biaoti = ['st';'nd';'rd';'th'];
H = X -mu*ones(1,40);
[U,S,V] = svd(H);
for i=1:1:3
    subplot(2,4,i+4);imshow(reshape(U(:,i),48,42),[]);
    title(['The ',num2str(i),biaoti(i,:) ,' eigen face']);
end
subplot(2,4,8);imshow(reshape(U(:,10),48,42),[]);
title(['The 10',biaoti(4,:), ' eigen face']);


U_d = U(:,1:d);
S_d = S(:,1:d);
sorted_singular_values=zeros(1,d);
for j=1:1:d
    sorted_singular_values(j)=S_d(j,j);
end
k=1:1:d;
subplot(2,4,2);plot(k,sorted_singular_values,'ro-');
title('Sorted singular values');

figure(2);

Y_test = U_d.' * (X - mu*ones(1,40));
X_test = mu*ones(1,40) + U_d*Y_test;
subplot(1,4,1);imshow(reshape(X_test(:,1),48,42),[]);
title('First individual');
subplot(1,4,2);imshow(reshape(X_test(:,11),48,42),[]);
title('Second individual');
subplot(1,4,3);imshow(reshape(X_test(:,21),48,42),[]);
title('Third individual');
subplot(1,4,4);imshow(reshape(X_test(:,31),48,42),[]);
title('Forth individual');
