clc;
clear all;

load('data1.mat');
mu = mean(data1,2);
image_mu = reshape(mu,48,42);
subplot(2,4,1);imshow(image_mu,[]);
title('The mean face');

biaoti = ['st';'nd';'rd';'th']
H = data1-mu*ones(1,10);
[U S V] = svd(H);
for i=1:1:3
    subplot(2,4,i+4);imshow(reshape(U(:,i),48,42),[]);
    title(['The ',num2str(i),biaoti(i,:) ,' eigen face']);
end
subplot(2,4,8);imshow(reshape(U(:,10),48,42),[]);
title(['The 10',biaoti(4,:), ' eigen face']);



