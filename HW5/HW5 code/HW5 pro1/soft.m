function z=soft(x,delta)
n=length(x);
z=zeros(n,1);
for i=1:n
    if abs(x(i))-delta >0
        big = abs(x(i))-delta;
    else
        big = 0;
    end
    z(i)=sign(x(i))*big;
end
  