function [ y ] = reorder( x )
%reorder
%
% Finds bit reversal order for input 'x ' by means of recursion

    if(mod(length(x),2) ~= 0)
        error('Input not of length 2^x');
    end
    
    if(length(x) == 2) % base case in recursion
        y = [x(1) x(2)];
    else
        a = x(1:2:length(x));
        b = x(2:2:length(x));
        ya = reorder(a);
        yb = reorder(b);
        y = [ya yb];
    end
    
end

