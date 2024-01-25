f=inline('1-2*v^2-t','t','v')
h=0.01
t=0
v=1
T(1)=t;
V(1)=v;
for i=1:300
v=v+h*f(t,v)
t=t+h;
T(i+1)=t;
V(i+1)=v;
end
