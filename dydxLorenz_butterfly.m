function dydxLorenz_butterfly(~,y)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
Y1=isnumeric(Y);
Y2=size(Y);
if Y1~=1 || Y2(2)~=3
    error(' y must be a numeric matrix with 3 columns.')
sigma=10;
b=8/3;
r=160;
X=y(1);
Y=y(2);
Z=y(3);


end

