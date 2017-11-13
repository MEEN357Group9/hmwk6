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
if Y1~=1 || Y2(2)~=3
    error(' y must be a numeric matrix with 3 columns.')
end
sigma1=10;
%b=8/3; Not sure why this is here.
r=160;
X=y(1);
Y=y(2);
%Z=y(3); Not sure why this is here.
dXdt=-sigma1*X+sigma1*Y;
dYdt=-X*Y+r*X-Y;
%dZdt=X*Y-b*Z; Not sure why this is here. 
dydx=dXdt/dYdt;

end

