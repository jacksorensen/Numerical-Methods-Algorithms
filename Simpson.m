function I = Simpson(x,y)
%This function uses Simpson's 1/3 Rule on tabulated date to estimate the integral of the data
%x is an equally spaced array of independent variables
%y is an array of dependent variables
%I is the estimated integral

%Determines how many input variables there are
n = length(x);

%Array made to check if x is equally spaced
C = linspace(x(1),x(n),n);
%Checks to see if the two arrays are equal
tf = isequal(x,C);
%Error if x is not equally spaced
if tf == 0
    error('The x input array is not equally spaced')
end

%Determines how many output variables there are
m = length(y);

%Error if the input arrays are not the same length
if m~=n
    error('Input arrays are not the same length')
end

%The h value used in the 1/3 Rule if there are an odd number of inputs
h = (x(n)-x(1))/(n-1);

%The h value used in the 1/3 rule if there are an even number of inputs
h2 = (x(n-1)-x(1))/(n-1);

%The h value used in the last trapezoidal rule 
h3 = (x(n)-x(n-1))/2;

%Sums of different intervals within the array, used for calculation
s1=0;
s2=0;
s3=0;
s4=0;
%This is the sum of all of the odd interval y values multiplied by 4, this
%is the second part of the 1/3 rule
for i=3:2:n-1
    s1= s1+4*y(i);
end
%This is the sum of all of the even interval y values multiplied by 4, this
%is the second part of the 1/3 rule
for j=2:2:n-2
    s2 = s2+2*y(j);
end 
%This is the sum of all of the odd interval y values multiplied by 4, this
%is the second part of the 1/3 rule. This is only used if there are an even
%amount of intervals.
for k=3:2:n-2
    s3= s3+4*y(k);
end
%This is the sum of all of the even interval y values multiplied by 4, this
%is the second part of the 1/3 rule. This is only used if there are an even
%amount of intervals.
for l=2:2:n-3
    s4=s4+2*y(l);
end


%Runs the 1/3 rule if there are an odd amount of intervals, and runs the
%1/3 rule plus the trapezoidal rule on the last interval if there are an
%even amount of intervals

if mod(n,2)==0
    I = (h/3).*(y(1)+s1+s2+y(n));
else
    I = ((h2/3).*(y(1)+s3+s4+y(n-1))) + (h3*(y(n)+y(n-1)));
    disp('Trapezoidal Rule was used on last interval')
end 
