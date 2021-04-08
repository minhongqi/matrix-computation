clear all;
clc;


load('all_data.mat');
ind = ones(7,20);

mu = mean(data_train,2);
H = data_train -mu*ones(1,40);
[U,S,V] = svd(H);

mu_test = mean(data_test,2);
H_test = data_test -mu_test*ones(1,20);
[U_test,S_test,V_test] = svd(H_test);

for d = 2:1:8
    U_d = U(:,1:d);
    Y_train = U_d.' * (data_train - mu_test*ones(1,40));
    X_train = mu_test*ones(1,40) + U_d*Y_train;
    

    U_d_test = U_test(:,1:d);
    Y_test = U_d_test.' * (data_test - mu_test*ones(1,20));
    X_test = mu_test*ones(1,20) + U_d_test*Y_test;

    for i = 1:1:20
        min = norm(X_test(:,i)-X_train(:,1));
        for j=1:1:40
            temp = norm(X_test(:,i)-X_train(:,j));
            if temp < min
                min = temp;
                ind(d-1,i) = j;               
            end
        end
    end
end

individual = zeros(7,20);
right = zeros(7,1);
error_rates = zeros(7,1);
for m=1:1:7
    for n=1:1:20        
        if (ind(m,n)>0) && (ind(m,n)<=10)
            individual(m,n) = 1;
        elseif (ind(m,n)>10) && (ind(m,n)<=20)
            individual(m,n) = 2;
        elseif (ind(m,n)>20) && (ind(m,n)<=30)
            individual(m,n) = 3;
        else
            individual(m,n) = 4;
        end
    end
end

for p = 1:1:7
    for q = 1:1:20
        if individual(p,q) == ceil(q/5)
            right(p) = right(p) + 1;
        end
    end
end

for ii = 1:1:7
    error_rates(ii) = 1 - right(ii)/20;
end
    



