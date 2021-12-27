function [output] = findFreq(input1,input2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    ind = maxk(input1,(input2*2)+1);
    ind = ind(2:2:end);
    output = find(ismember(input1,ind));
end

