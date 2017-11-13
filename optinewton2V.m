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
%                    optimum value of y for f(x,y)
%  y_opt:
%
%
% Assignment 6, Task 2
% Group 9: Kelsey Banasik, Zarah Navarro, Harland Ashby, Sonia Sanchez
%

%% Error Input and Output Checking



%% Initializing Values
TolX = 0.001;
h = 0.2;

%% Hessian Matrix
X=x;
Y=y;
syms x y

equ1 = diff(diff(f,x));
equ2 = diff(diff(f,y),x);
equ3 = diff(diff(f,x),y);
equ4 = diff(diff(f,y));

eq1 = subs(equ1,[x,y],[X,Y]);
eq2 = subs(equ2,[x,y],[X,Y]);
eq3 = subs(equ3,[x,y],[X,Y]);
eq4 = subs(equ4,[x,y],[X,Y]);

H = [eq1, eq2; eq3, eq4]

%% Gradient of f(x,y)

gx = diff(f,x);
gy = diff(f,y);

g1 = subs(gx,[x,y],[X,Y]);
g2 = subs(gy,[x,y],[X,Y]);

G = [g1 ; g2]










end

