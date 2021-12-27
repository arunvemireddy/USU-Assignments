function [outputIm] = HighlighShadow(inputIm)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[row,col] = find(inputIm==1);
ball = imread('ball.bmp');
for i = 1:size(row,1)
       
        ball(row(i),col(i),1)=255;
        ball(row(i),col(i),2)=0;
        ball(row(i),col(i),3)=0;
  
end
outputIm = ball;
end

