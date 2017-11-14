% Task 3 Homework 6
% Runge-Kutta butcher table elements for Kutta preferred method

field01 = 'b1';
field02 = 'b2';
field03 = 'b3';
field04 = 'b4';
field05 = 'c1';
field06 = 'c2';
field07 = 'c3';
field08 = 'A11';
field09 = 'A21';
field10 = 'A22';
field11 = 'A31';
field12 = 'A32';
field13 = 'A33';

value01 = 1/8;
value02 = 3/8;
value03 = 3/8;
value04 = 1/8;
value05 = 1/3;
value06 = 2/3;
value07 = 1;
value08 = 1/3;
value09 = -1/3;
value10 = 1;
value11 = 1;
value12 = -1;
value13 = 1;

Kutta = struct(field01,value01, field02, value02, ...
    field03, value03, field04, value04, field05, value05, ...
    field06, value06, field07, value07, field08, value08, ...
    field09, value09, field10, value10, field11, value11, ...
    field12, value12, field13, value13);