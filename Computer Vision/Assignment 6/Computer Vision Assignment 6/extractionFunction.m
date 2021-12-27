function [outputImg] = extractionFunction(inputImg)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[row,col]= size(inputImg);
outputImg = ones(row,col);
b=30;
for i = 1:row
    for j = 1:col
        if(mod(inputImg(i,j),b)>(b/2))
            outputImg(i,j)=1;
        else
            outputImg(i,j)=0;
        end
    end
end
end

