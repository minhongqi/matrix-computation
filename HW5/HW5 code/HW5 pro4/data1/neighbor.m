function answe = neighbor(x,d)

for i=1:1:40
    
    Y_test = U_d.' * (X - mu*ones(1,10));