function y1 = ode_Kutta(Kutta, f, h, x0, y0)
%  uses data from a Kutta data struct to establish the integratore
% 
% Inputs: 
% Kutta: An instance of the Kutta data struct.
% f : A function handle to the right-hand side of an ODE, e.g., dy/dx = f(x,y).
% h : step size, viz., x 1 = x 0 + h.
% x0 : Independent variable at beginning of step.
% y0 : Dependent variable at beginning of step, i.e., the initial condition.
% 
% Output: 
% y1 : Dependent variable at end of one step, same dimension as f.

% Error Checking
if ~isstruct(Kutta) % checks if Kutta is a struct
    error('Kutta is not a struct')
end

if ~isscalar(x0) % checks if x0 is a scalar  
    error('x0 must be scalar')
end

if ~isscalar(h) % checks if h is a scalar
    error('h must be scalar')
end

if h <= 0 % makes sure h is positive
    error('h must be a positive value')
end

if size(f) ~= size(y0) % makes sure f and y0 are the same size
    error('f and y0 must be the same dimensions')
end 


% Runge-Kutta Part
k1 = f(x0, y0);
k2 = f(x0 + Kutta.c1*h, y0 + h(Kutta.A11*k1));
k3 = f(x0 + Kutta.c2*h, y0 + h(Kutta.A21*k1 + Kutta.A22*k2));
k4 = f(x0 + Kutta.c3*h, y0 + h(Kutta.A31*k1 + Kutta.A32*k2 + Kutta.A33*k3));

y1 = y0 + h(Kutta.b1*k1 + Kutta.b2*k2 + Kutta.b3*k3 + Kutta.b4*k4);

end