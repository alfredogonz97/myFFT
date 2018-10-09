function [ y ] = myFFT( x )
%myFFT
%
% @author: Alfredo Gonzalez
% FFT function that performs a 16 point fft
    x = reorder(x);
    y = butterFly(x);
end