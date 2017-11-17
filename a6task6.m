X0 = 8;
Y0 = 8;
Z0 = 161;

hr = 0.05;
nr = 100;
hb = 0.01;
nb = 500;

f = @(x,y) Lorenz_butterfly(x,y);

run theRungeKutta
Xs = 1;
Ys = [X0;Y0;Z0];

XRKr = zeros(1);% makes the matrix for x
XRKr(1) = X0;
YRKr = zeros(1);% makes the matrix that y values will be stored in.
YRKr(1) = Y0;
ZRKr = zeros(1);
ZRKr(1) = Z0;

for i = 1:nr
    yeah = ode_Kutta(Kutta,f,hr,Xs,Ys);
    Ys = yeah;
    Xs = Xs + hr;
    
    XRKr(i+1) = yeah(1);
    YRKr(i+1) = yeah(2);
    ZRKr(i+1) = yeah(3);
end

plot(XRKr,YRKr)
    