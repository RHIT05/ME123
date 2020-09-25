% %  Program:  cannibal.m                        
% %  ME123 Final Exam Programming, Problem 4
% A simple governing equation for predicting how populations increase
% (or decrease) is a fuction of time is given by dP/dt=(B-d)*P
% Where B is the natural birth rate coefficient
% d is natural death rate coefficient
% P is the population
% 
% In cannibalistic models d= a*P
% Where a is the random meet and eat coefficent
% 
% If you combine the two equations you get (in Finite Difference Form)
% (P2-P1)/(t2-t1)=(B-a*P1)*P1
%   Which solves to:
% P2= -P1*(-1-y_step*B+a*P1*y_step) (thanks to Maple)
% 
% Where P2 is the new population and P1 is the old population
% t2-t1 is the change in time
% 
% Input:  The user will enter values for each of the following variables
%         init_pop = The initial population
%         years = number of years to model
%         y_step = how many years to incriment at a time
%         a =  random meet and eat coefficient
%         B = natural birth rate coefficient
%         
% Output: Output from this program includes
%         1) Table with year and year and current population
%         2) Plots the population as a function of time.
%         
% Written by RHIT05
%     Date: 2/19/2002
%
clc
clear
fprintf('\nWelcome to ME123''s Canibalistic Simulation\n\nPlease enter the following needed information\n')
% Data input section
init_pop=input('Initial population= ');
years=input('The number of years you would like to simulate= ');
y_step=input('The number of years the model should incriment= ');
a=input('Random meet and eat coefficient= ');
B=input('Natural birth rate coefficient= ');

% Value intilization
i=1;
P1=init_pop;

% Calculation & Table
for y=1:y_step:years
    P2= -P1*(-1-y_step*B+y_step*a*P1);
    P1=floor(P2);    
    year(i)=y;
    pop(i)=P1;
    i=i+1;
end%for
tblwrite([year',pop'],str2mat('Year','Population'),'','pop.dat')
type('pop.dat')
% Plot output
plot(year,pop)
xlabel('Time')                                         
ylabel('Cannibal Population')
title(['Final Cannibal Population after ', num2str(years), ' years is ', num2str(P1)])
fprintf('This concludes our broadcasting day.  It''s been a good year learning MatLab, \nWorking Model, and HTML.  Hope to see you in future classes\n')
