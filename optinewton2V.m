function [ x_opt, y_opt ] = optinewton2V( f,x,y )
%% OPTINEWTON2V(f,x,y)   Newton's Method of advanced gradient approach of
%                              optimization for 2 variables
%  INPUT ARGUMENT
%  x:            scalar x value
%  y:            scalar y value
%  f:            a handle to an external function with interface f(x,y)
%
%  RETURN ARGUMENT
%  x_opt:            optimum value of x for f(x,y)
%  y_opt:            optimum value of y for f(x,y)
%
% Assignment 6, Task 2
% Group 9: Kelsey Banasik, Zarah Navarro, Harland Ashby, Sonia Sanchez
%

%% Error Input Checking

if isscalar(x) == 0
    error('Please input a scalar value for x');
elseif isscalar(y) == 0
    error('Please input a scalar value for y');
end

%% Initializing Values
TolX = 0.001;      % Halting Error
h = 0.2;           % Step Size
deltaX = 0;        % Error

%% Newton Method Loop

% Step Sizes for x and y
dx = h;
dy = h;

while deltaX < TolX

% Hessian Matrix
d2fdx2 = (f(x+dx,y) - 2*f(x,y) + f(x-dx,y))/(dx^2);
d2fdxdy = (f(x+dx,y+dy) - f(x+dx,y-dy) - f(x-dx,y+dy) + f(x-dx,y-dy))/(4*dx*dy);
d2fdydx = (f(x+dx,y+dy) - f(x+dx,y-dy) - f(x-dx,y+dy) + f(x-dx,y-dy))/(4*dx*dy);
d2fdy2 = (f(x,y+dy) - 2*f(x,y) + f(x,y-dy))/(dy^2);

H = [d2fdx2, d2fdxdy; d2fdydx, d2fdy2];

% Gradient of f(x,y)
dfdx = (f(x+dx,y) - f(x-dx,y))/(2*dx);
dfdy = (f(x,y+dy) - f(x,y-dy))/(2*dy);

G = [dfdx ; dfdy];

% Newtonian Direction
D = H\G;

% Previous x and y values
xx = x;
yy = y;
old = sqrt((xx^2)+(yy^2));

% New x and y values
x = xx - D(1);
y = yy - D(2);
new = sqrt((x^2)+(y^2));

% Halting criteria determination
deltaX = abs(new - old);

end

%% Optimum Values

x_opt = x;
y_opt = y;

end

