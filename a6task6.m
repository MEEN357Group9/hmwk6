X0 = 8;
Y0 = 8;
Z0 = 161;

hr = 0.05;
nr = 100;
hb = 0.01;
nb = 500;

f = @(x,y) Lorenz_butterfly(x,y);
%% this is THE RUNGE KUTTA
run theRungeKutta
Ys = [X0;Y0;Z0];

XRKr = zeros(1);% makes the matrix for x
XRKr(1) = X0;
YRKr = zeros(1);% makes the matrix that y values will be stored in.
YRKr(1) = Y0;
ZRKr = zeros(1);
ZRKr(1) = Z0;
t = 0:hr:5;


for i = 1:nr-1
    yeah = ode_Kutta(Kutta,f,hr,t(i+1),Ys);
    
    Ys = yeah; % assigns the new values to be used in the next run
    
    % since X matrix already has initial conditions, then the new value
    % needs to be placed in the next value for the matrix. 
    XRKr(i+1) = yeah(1); % assigns from the new values to then plot later 
    YRKr(i+1) = yeah(2);
    ZRKr(i+1) = yeah(3);
end
Ys = [X0;Y0;Z0];

XRKb = zeros(1);% makes the matrix for x
XRKb(1) = X0;
YRKb = zeros(1);% makes the matrix that y values will be stored in.
YRKb(1) = Y0;
ZRKb = zeros(1);
ZRKb(1) = Z0;
t2 = 0:hb:5;
for j = 1:nb
yeah = ode_Kutta(Kutta,f,hb,t2(j+1),Ys);
    
    Ys = yeah; % assigns the new values to be used in the next run
    
    % since X matrix already has initial conditions, then the new value
    % needs to be placed in the next value for the matrix. 
    XRKb(j+1) = yeah(1); % assigns from the new values to then plot later 
    YRKb(j+1) = yeah(2);
    ZRKb(j+1) = yeah(3);
end
figure('NumberTitle', 'off', 'Name', 'The Runge Kutta Method')
subplot(1,3,1)
plot(XRKr,YRKr, 'r',XRKb,YRKb, 'b')
title('X vs Y')
legend('n = 100','n = 500','location', 'northeast')
subplot(1,3,2)
plot(YRKr,ZRKr, 'r',YRKb,ZRKb, 'b')
title('Y vs Z')
legend('n = 100','n = 500','location', 'northeast')
subplot(1,3,3)
plot(ZRKr,XRKr, 'r',ZRKb,XRKb, 'b')
legend('n = 100','n = 500','location', 'northeast')
title('Z vs X')

%% PREFERRED RUNGE KUTTA

Ys = [X0;Y0;Z0];

XRKr = zeros(1);% makes the matrix for x
XRKr(1) = X0;
YRKr = zeros(1);% makes the matrix that y values will be stored in.
YRKr(1) = Y0;
ZRKr = zeros(1);
ZRKr(1) = Z0;
t = 0:hr:5;


for i = 1:nr-1
    yeah = ode_Kutta(Kutta,f,hr,t(i+1),Ys);
    
    Ys = yeah; % assigns the new values to be used in the next run
    
    % since X matrix already has initial conditions, then the new value
    % needs to be placed in the next value for the matrix. 
    XRKr(i+1) = yeah(1); % assigns from the new values to then plot later 
    YRKr(i+1) = yeah(2);
    ZRKr(i+1) = yeah(3);
end



run KuttaPreferred.m
Ys = [X0;Y0;Z0];

XRKb = zeros(1);% makes the matrix for x
XRKb(1) = X0;
YRKb = zeros(1);% makes the matrix that y values will be stored in.
YRKb(1) = Y0;
ZRKb = zeros(1);
ZRKb(1) = Z0;
t2 = 0:hb:5;
for j = 1:nb
yeah = ode_Kutta(Kutta,f,hb,t2(j+1),Ys);
    
    Ys = yeah; % assigns the new values to be used in the next run
    
    % since X matrix already has initial conditions, then the new value
    % needs to be placed in the next value for the matrix. 
    XRKb(j+1) = yeah(1); % assigns from the new values to then plot later 
    YRKb(j+1) = yeah(2);
    ZRKb(j+1) = yeah(3);
end

figure('NumberTitle', 'off', 'Name', 'The Kutta Preferred Method')
subplot(1,3,1)
plot(XRKr,YRKr, 'r',XRKb,YRKb, 'b')
legend('n = 100','n = 500','location', 'northeast')
title('X vs Y')
subplot(1,3,2)
plot(YRKr,ZRKr, 'r',YRKb,ZRKb, 'b')
legend('n = 100','n = 500','location', 'northeast')
title('Y vs Z')
subplot(1,3,3)
plot(ZRKr,XRKr, 'r',ZRKb,XRKb, 'b')
legend('n = 100','n = 500','location', 'northeast')
title('Z vs X')
    