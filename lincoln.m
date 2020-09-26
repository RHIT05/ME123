function [a,b,R]=powerfit(x,y)
%  POWERFIT(x,y) gives you the slope and intercept of a best fit line of 
%       power form and the correlation coefficient when given vectors x and
%       y (of the same size).
%
%  Written by:  Beige Group (Period 1)  Date: 1-17-02
n=length(x);
%% Conversion for specific fit
%Power Fit
x=log(x);
y=log(y);
% Getting the sumed values needed
sum_x=sum(x);
sum_y=sum(y);
sum_x2=sum(x.^2);
sum_xy=sum(x.*y);
sum_y2=sum(y.^2);
% Finding the slope and intercept
slope=(n*sum_xy-sum_x*sum_y)/(n*sum_x2-sum_x^2);
intercept=(sum_y*sum_x2-sum_x*sum_xy)/(n*sum_x2-sum_x^2);
% Converting in to a and be to be used in the equation y=ax+b
a=slope;
b=exp(intercept);
% Finding correlation coeficient
R=(((n*sum_xy)-(sum_x*sum_y)))/((sqrt((n*sum_x2)-(sum_x^2))*sqrt((n*sum_y2)-(sum_y^2))));
