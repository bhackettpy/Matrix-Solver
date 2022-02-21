clc, clear all, format shortG
%-------------------------
%If you the output in decimal points, use "format shortG". If you want
%to see fractional outputs, use "format rat" at the top.

%This script (soon to be function) takes an 3x(3 or 4) matrix and reduces
%it to RREF through row mathematics. It may not always take the most
%"optimal" path since it does not care about fractions and decimals.

%Simply define your matrix A (it must be a 3x3 or 3x4 matrix for the RREF
%solver to work) and uncomment the section of code you want to run and run
%it this file.

%Here are some examples of how to define a 3x3 matrix:
% A = [1 2 1 -2;-2 -3 -1 1;2 4 2 -4]; %zero bottom row case
% A = [6 8 10 18800;6 7 5 13000;5 8 15 23400]; %zero tolerance case
% A = [1 -1 3;2 1 2;-2 -2 1];
% A = rand(3,4); %random 3x4 matrix of numbers

%Define your A matrix here (must be square matrix for inverse to work or
%3x3/3x4 for RREF to work)
A = [1 -1 3;2 1 2;-2 -2 1];

%Write what you want to do: 1 = RREF, 2 = inverse (flag = 1 or 2)
flag = 3;

if flag == 1
    [A_RREF] = RREF(A)
elseif flag == 2
    A_inv = inv(A)
else
    warning('You are a fucking idiot. I specifically said define "flag" as 1 or 2')
end

