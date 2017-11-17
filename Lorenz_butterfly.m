function dydx=Lorenz_butterfly(~,y)
%{
This function creates the Lorenz Butterfly. 
    Inputs:
        y: The dependent variable, which is a column vector.
        ~: This is a homogeneous system of equations. It does not depend on x, hence the tilde.
    Output:
        dydx: An evaluation of the differential equation dy/dx = f(x, y). This will be a vector with the same length as y.
%}
Y1=isnumeric(y);
Y2=size(y);
if Y2(1)~=3 || Y2(2)~=1 || Y1~=1
    error(' y must be a numeric matrix with 1 column and 3 rows.')
end
sigma1=10;
b=8/3; 
r=160;
X=y(1);
Y=y(2);
Z=y(3); 
dX=-sigma1.*X+sigma1.*Y;
dY=-X.*Y+r.*X-Y;
dZ=X.*Y-b.*Z; 
dydx=[dX;dY;dZ];
end

