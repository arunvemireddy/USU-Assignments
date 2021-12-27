function [output] = FilterCon(input,indexes)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    filter = [1,1,1;1,0,1;1,1,1]/8;
    conv_value = imfilter(input,filter);
    output = input;
    output(indexes) = conv_value(indexes);
end

