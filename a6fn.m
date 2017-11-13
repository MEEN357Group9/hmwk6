function f=a6fn(X,Y)
%{
In this function, the value of the function 5x^2-xy+y^2-y.
    Inputs:
        X: X is a scalar numeric value.
        Y: Y is a scalar numeric value.
    Output:
        f: f is the output of the function. 
%}
x1=isscalar(X);
x2=isnumeric(X);
y1=isscalar(Y);
y2=isnumeric(Y);
if x1~=0 || x2~=1 || y1~=0 || y2~=1
    error('X and Y must be scalar numbers.') %If you get this error, please try again. 
end 
x=X;
y=Y;
f=5*x^2-x*y+y^2-y;
end

