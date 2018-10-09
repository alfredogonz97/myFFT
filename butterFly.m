function [y] = butterFly(x)
%butterFly
%
% Does the butterfly calculations for a 16 point fft

len = length(x);
W = exp(-1i*2*pi*(1/16)); %sets up twiddle factors
switch(len)
    case 16
        k = 0:1:7;
    case 8
        k = 0:2:6;
    case 4
        k = 0:4:4;
    case 2
        k = 0;
end
Wk = W .^ k; %takes twiddle factors to its respective exponentials

if(len == 2) %base case in rcursion
    a = x(1) + x(2);
    b = x(1) - x(2);
    y = [a b];
else    
    xa = x(1:1:len/2); %takes first hald of values
    xb = x((len/2)+1:1:len); %takes second half of values
    ya = butterFly(xa); %performs recursion
    yb = butterFly(xb);  
    
    yb = yb .* Wk; %multiply by twiddle factors
    
    y = NaN(1,len);
    for i = 1:len/2 %do butterfly calculations
        y(i) = ya(i) + yb(i);
        y((len/2)+i) = ya(i) - yb(i);
    end    
end

end

