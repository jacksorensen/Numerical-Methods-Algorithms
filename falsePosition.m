function [root fx ea iter]=falsePosition(func,xl,xu,es,maxiter)
%This fuction uses the false position method to dertimine the root of a
%function between two initial x values given by the user
%func is the function that the method will be executed on
%xl is the first x value in the bracket
%xu is the second x value in the bracket
%es and maxiter are the stopping criterion
%root is the value of xr after the stopping criterion have been met
%fx is the value of the function evaluated at xr
%ea is the relative approximate error
%iter is the number of iterations that took place
if nargin<3
    error('At least 3 Arguments Required')
end
%Makes sure the user does not input the wrong number of inputs
signchange = func(xl)*func(xu);
if signchange>0
    error('No Sign Change Occurred Between Inputs')
end
%Checks to make sure the function is changing signs between xl and xu
%before proceding
iter = 0;
ea = 100;
xr = xl;
es = 0.0001;
maxiter = 200;
while (1)
    xrprev = xr;
    %The next two lines of code allowed me to conduct the following line
    %without an error because of an indexing problem
    fxu = func(xu);
    fxl= func(xl);
    xr = xu - fxu*(xl-xu)/(fxl-fxu);
    iter = iter+1;
    %Calculated the relative approximate error
    if xr ~=0 
        ea = abs((xr-xrprev)/xr)*100;
    end
    xrtest = func(xr)*func(xl);
    %Test to see if the function evaluated at xr is the same sign as xl, if
    %so, xl is replaced by xr. If they are opposite signs, xu is replaced
    %by xr.
    if xrtest <0
        xu=xr;
    elseif xrtest >0
        xl=xr;
    else 
        ea =0;
    end
    %Stopping criterion for the while loop executed here
    if ea <= es | iter >= maxiter
        break
    end
end
root=xr
fx = func(xr)
iter
ea



