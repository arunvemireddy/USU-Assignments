function [output] = CalNormalizedHSVHist(inputImg,hbin,sbin,cbin)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
inputImg =  rgb2hsv(inputImg);
inputImg = inputImg .*255;
totalBins = hbin*sbin*cbin;
output = zeros(1,totalBins);
[row,col,channel]=size(inputImg);
hueIm = inputImg(:,:,1);
satIm = inputImg(:,:,1);
valIm = inputImg(:,:,1);
for i = 1:row
    for j = 1:col
        hbinVal = floor((hueIm(i,j)*hbin)/256);
        sbinVal = floor((satIm(i,j)*sbin)/256);
        cbinVal = floor((valIm(i,j)*cbin)/256);
        position =  (hbinVal*sbinVal*cbinVal)+ (sbinVal*cbinVal)+cbinVal+1;
        output(position)= output(position)+1;
    end
end
end

